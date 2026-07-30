vim.keymap.set("v", "<C-c>", "\"+y", { noremap = true, silent = true })

-- vim.keymap.set("n", "<C-t>", "<Nop>")
-- vim.keymap.set("n", "<C-t>n", "<Cmd>tabnew<CR>", { desc = "New tab" })
-- vim.keymap.set("n", "<C-t>w", "<Cmd>tabclose<CR>", { desc = "Close tab" })

vim.keymap.set({ "n" }, "<A-q>", "<Cmd>quitall<CR>")
vim.keymap.set({ "n" }, "<A-e>", "<Cmd>e .<CR>")

vim.keymap.set({ "n", "i", "t" }, "<A-t>", "<Cmd>tabnew<CR>", { desc = "new tab" })
vim.keymap.set({ "n", "i", "t" }, "<A-w>", "<Cmd>tabclose<CR>")

vim.keymap.set({ "n", "i", "t" }, "<C-Tab>", "<Cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set({ "n", "i", "t" }, "<C-S-Tab>", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })
