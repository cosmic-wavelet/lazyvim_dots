-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
vim.keymap.set("i", "ii", "<ESC>", opts)
vim.keymap.set("i", "<C-t>", "<Nop>", opts)
vim.keymap.set("i", "<C-k>", "<Nop>", opts)
vim.keymap.set("t", "ii", "<C-\\><C-n>", opts)
vim.keymap.set("i", "jj", "<ESC>vg~a", opts)
local map = vim.keymap.set

-- Map <leader>h in normal mode to show hover docs
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP Hover" })
