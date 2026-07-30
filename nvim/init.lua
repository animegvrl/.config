require("keybinds")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.list = true
vim.opt.listchars = {
    trail = '·',
    tab = '→→',
    -- eol = '↲',
}
vim.opt.fixendofline = true

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })

vim.opt.colorcolumn = "100"
vim.cmd [[highlight ColorColumn guibg=#ff0000 ctermbg=NONE]]


-- remember last position of cursor when opening a file
-- vim.api.nvim_create_augroup("last_pos", { clear = true })
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = "last_pos",
--   pattern = "*",
--   callback = function()
--     local mark = vim.api.nvim_buf_get_mark(0, '"')  -- returns {lnum, col}
--     local lnum = mark[1]
--     local col = mark[2]
--     if lnum > 0 and lnum <= vim.api.nvim_buf_line_count(0) then
--       vim.api.nvim_win_set_cursor(0, {lnum, col})
--     end
--   end,
-- })

-------------------------------------------------------------------
-- Per-directory ("workspace") sessions, no plugins required.
-- Saves tabs/windows/buffers/cursor position on exit and restores
-- them next time you open nvim from the same directory.
-------------------------------------------------------------------

-- Be explicit about what a session captures, instead of depending
-- on whatever nvim's built-in default happens to be.
vim.o.sessionoptions =
  'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

local session_dir = vim.fn.stdpath('data') .. '/sessions/'
vim.fn.mkdir(session_dir, 'p')

-- Directories to never treat as a "workspace" (add more if you like)
local ignored_dirs = { vim.fn.expand('~') }

-- Capture the launch directory once. If you `:cd` elsewhere later,
-- saving/restoring still refers to where nvim was started.
local project_dir = vim.fn.getcwd()

-- e.g. /home/user/project -> %home%user%project.vim
local function session_file(dir)
  local name = dir:gsub('[:\\/]', '%%')
  return session_dir .. name .. '.vim'
end

-- Bare `nvim`, `nvim .`, and `nvim /some/dir` all count as "open
-- this directory as a workspace". An explicit *file* argument
-- (`nvim foo.txt`, nvim as $EDITOR / git's commit editor, etc.)
-- skips the whole mechanism.
local function opened_with_file_args()
  local argc = vim.fn.argc()
  if argc == 0 then
    return false
  end
  if argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
    return false
  end
  return true
end

local function should_manage_session()
  if opened_with_file_args() then
    return false
  end
  for _, dir in ipairs(ignored_dirs) do
    if project_dir == dir then
      return false
    end
  end
  return true
end

local function restore_session()
  if not should_manage_session() then
    return
  end
  local file = session_file(project_dir)
  if vim.fn.filereadable(file) == 1 then
    pcall(vim.cmd, 'silent! source ' .. vim.fn.fnameescape(file))
  end
end

local function save_session()
  if not should_manage_session() then
    return
  end
  pcall(vim.cmd, 'mksession! ' .. vim.fn.fnameescape(session_file(project_dir)))
end

local group = vim.api.nvim_create_augroup('DirectorySessions', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
  group = group,
  nested = true,
  callback = restore_session,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  group = group,
  callback = save_session,
})

-- Manual controls, in case you want to snapshot or reload without :qa
vim.api.nvim_create_user_command('SessionSave', save_session, {})
vim.api.nvim_create_user_command('SessionRestore', restore_session, {})
