return {
  "Mofiqul/dracula.nvim",
  as = "dracula",
  config = function()
    vim.defer_fn(function()
      require("dracula").setup({
        colors = {
          bg = "#282a36",
          fg = "#f8f8f2",
          selection = "#44475a",
          comment = "#6272a4",
          red = "#ff5555",
          orange = "#ffb86c",
          yellow = "#f1fa8c",
          green = "#50fa7b",
          purple = "#bd93f9",
          cyan = "#8be9fd",
          pink = "#ff79c6",
          bright_red = "#ff6e6e",
          bright_green = "#69ff94",
          bright_yellow = "#ffffa5",
          bright_blue = "#d6acff",
          bright_magenta = "#ff92df",
          bright_cyan = "#a4ffff",
          bright_white = "#ffffff",
          menu = "#21222c",
          visual = "#3e4451",
          gutter_fg = "#4b5263",
          nontext = "#3b4048",
        },
        show_end_of_buffer = false,
        transparent_bg = false,
        italic_comment = true,
      })
    end, 100) -- Delay to ensure colors load after Neo-tree

    -- Apply custom highlights for Neo-tree
    vim.cmd("highlight NeoTreeTitleBar guibg=#bd93f9 guifg=#21222c")
  end,
}
