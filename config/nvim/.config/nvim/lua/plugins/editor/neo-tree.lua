-- Enable mouse support
vim.o.mouse = "a"

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 35,
        },
        filesystem = {
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          group_empty_dirs = true,
          hijack_netrw_behavior = "open_default",
          filtered_items = {
            hide_dotfiles = true, -- Hide dotfiles
            hide_gitignored = true, -- Hide gitignored files
          },
        },
      })

      -- Keep icons' original colors even when selected or hovered
      vim.cmd("highlight NeoTreeFileIcon guifg=#BD93F9")   -- Keep file icon color consistent
      vim.cmd("highlight NeoTreeDirectoryIcon guifg=#BD93F9") -- Keep directory icon color consistent
      vim.cmd("highlight NeoTreeDirectoryName guifg=#BD93F9") -- Directory name color

      -- Customize the selection line to only change the background
      vim.cmd("highlight NeoTreeCursorLine guibg=#44475a guifg=NONE") -- Background for selected item
    end,
  },
}
