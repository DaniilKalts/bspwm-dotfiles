-- General Settings
vim.o.number = true         -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers

-- Tabs and Indentation
vim.opt.tabstop = 2      -- Number of spaces per tab
vim.opt.shiftwidth = 2   -- Number of spaces to use for auto-indentation
vim.opt.softtabstop = 2  -- Number of spaces when hitting <Tab> in insert mode
vim.opt.expandtab = true -- Convert tabs to spaces

-- Clipboard Integration
vim.o.clipboard = "unnamedplus" -- Use system clipboard for yank, delete, change, and put

-- Set Space as the leader key
vim.g.mapleader = " "

-- Create key mappings to move cursor while keeping it centered
vim.api.nvim_set_keymap("n", "j", "jzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "kzz", { noremap = true, silent = true })

-- Auto-command for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.tabstop = 2    -- Set tab width to 2 spaces for Markdown
    vim.opt_local.shiftwidth = 2 -- Set indentation to 2 spaces for Markdown
    vim.opt_local.expandtab = true -- Convert tabs to spaces in Markdown
  end,
})
