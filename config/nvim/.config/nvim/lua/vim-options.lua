-- General Settings
vim.o.number = true -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers

-- Tabs and Indentation
vim.opt.tabstop = 2 -- Number of spaces per tab
vim.opt.shiftwidth = 2 -- Number of spaces to use for auto-indentation
vim.opt.softtabstop = 2 -- Number of spaces when hitting <Tab> in insert mode
vim.opt.expandtab = true -- Convert tabs to spaces

-- Clipboard Integration
vim.o.clipboard = "unnamedplus" -- Use system clipboard for yank, delete, change, and put

-- Set Space as the leader key
vim.g.mapleader = " "

-- Create key mappings to move cursor while keeping it centered
vim.api.nvim_set_keymap("n", "j", "jzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "kzz", { noremap = true, silent = true })
