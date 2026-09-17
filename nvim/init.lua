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

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },

  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },

  root_markers = {
    'tsconfig.json',
    'package.json',
    'jsconfig.json',
    '.git',
  },
})

vim.lsp.enable('ts_ls')

require("keybinds")
require("config.lazy")
