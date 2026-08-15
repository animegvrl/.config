vim.keymap.set({ "n", "i", "t", "v" }, '<S-Up>', '<Nop>', { noremap = true })
vim.keymap.set({ "n", "i", "t", "v" }, '<S-Down>', '<Nop>', { noremap = true })

vim.keymap.set("v", "<C-c>", "\"+y", { noremap = true, silent = true })
-- vim.keymap.set('c', 'q<CR>', '<Cmd>quitall<CR>')
-- vim.keymap.set('c', 'q<CR>', function()
--   local buftype = vim.bo.buftype
--   if buftype == '' then
--     vim.cmd('quitall')
--   else
--     vim.cmd('quit')
--   end
-- end, { noremap = true })



-- vim.keymap.set("n", "<C-t>", "<Nop>")
-- vim.keymap.set("n", "<C-w>", "<Nop>")
-- vim.keymap.set("n", "<C-t>n", "<Cmd>tabnew<CR>", { desc = "New tab" })
-- vim.keymap.set("n", "<C-t>w", "<Cmd>tabclose<CR>", { desc = "Close tab" })

vim.keymap.set({ "n" }, "<A-q>", "<Cmd>quitall<CR>")
vim.keymap.set({ "n" }, "<A-e>", "<Cmd>e .<CR>")

vim.keymap.set({ "n", "i", "t" }, "<C-e>", "<Cmd>Telescope find_files<CR>")

vim.keymap.set({ "n", "i", "t" }, "<C-t>", "<Cmd>tabnew<CR>", { desc = "new tab" })
vim.keymap.set({ "n", "i", "t" }, "<C-w>", "<Cmd>tabclose<CR>", { nowait = true })

vim.keymap.set({ "n", "i", "t" }, "<C-Tab>", "<Cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set({ "n", "i", "t" }, "<C-S-Tab>", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })
