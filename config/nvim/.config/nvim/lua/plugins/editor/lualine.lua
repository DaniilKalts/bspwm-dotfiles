return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula", -- Use the Dracula theme for the statusline
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },                               -- Show the current mode with a separator on the left and padding on the right
        },
        lualine_b = { "filename", "branch" },                                                     -- Show the filename and the current Git branch
        lualine_c = {
          { "diagnostics", sources = { "nvim_lsp" }, sections = { "error", "warn", "info", "hint" } }, -- Show diagnostics from LSP
        },
        lualine_x = { "encoding", "fileformat" },                                                 -- Show the file encoding and format
        lualine_y = { "filetype", "progress" },                                                   -- Show the file type and progress through the file
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },                           -- Show the cursor location with a separator on the right and padding on the left
        },
      },
      inactive_sections = {
        lualine_a = { "filename" }, -- Inactive section showing the filename
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" }, -- Inactive section showing the cursor location
      },
    })
  end,
}
