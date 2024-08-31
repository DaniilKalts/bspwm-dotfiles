return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  config = function()
    -- Seamless Tmux and Neovim Navigation in Normal Mode
    vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { noremap = true, silent = true })

    -- Seamless Tmux and Neovim Navigation in Terminal Mode
    vim.api.nvim_set_keymap(
      "t",
      "<C-h>",
      [[<C-\><C-n><cmd>TmuxNavigateLeft<CR>]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "t",
      "<C-l>",
      [[<C-\><C-n><cmd>TmuxNavigateRight<CR>]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "t",
      "<C-j>",
      [[<C-\><C-n><cmd>TmuxNavigateDown<CR>]],
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><cmd>TmuxNavigateUp<CR>]], {
      noremap = true,
      silent = true,
    })
  end,
}
