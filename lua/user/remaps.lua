-- Set the leader before running anything else (so this file should be sourced
-- early in configuration
vim.g.mapleader = " "

-- Default options
local opts = { noremap = true, silent = true }

-- Open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

vim.keymap.set("n", "<leader>ce", ":lua EditConfig()<CR>", opts)
vim.keymap.set("n", "<leader>cs", ":lua ReloadConfig()<CR>", opts)

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)  -- Left
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)  -- Down
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)  -- Up
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)  -- Right

-- Resize Windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

