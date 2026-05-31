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

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- remember last position of cursor when opening a file
vim.api.nvim_create_augroup("last_pos", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "last_pos",
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')  -- returns {lnum, col}
    local lnum = mark[1]
    local col = mark[2]
    if lnum > 0 and lnum <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, {lnum, col})
    end
  end,
})
