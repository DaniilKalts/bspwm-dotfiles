return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules" }, -- Ignore the node_modules directory in search results
          layout_strategy = "horizontal",       -- Use horizontal layout
          layout_config = {
            horizontal = {
              preview_width = 0.55, -- Adjust preview width to take up more space
              prompt_position = "bottom", -- Position the prompt at the bottom
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      -- Load the ui-select extension
      require("telescope").load_extension("ui-select")
    end,
  },
}
