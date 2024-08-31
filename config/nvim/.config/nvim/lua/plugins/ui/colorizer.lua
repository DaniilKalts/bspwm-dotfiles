return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*",              -- Highlight all files, but you can restrict it to specific file types
    }, {
      RGB = true,       -- Enable #RGB hex codes
      RRGGBB = true,    -- Enable #RRGGBB hex codes
      names = true,     -- Enable color names like "Blue"
      RRGGBBAA = true,  -- Enable #RRGGBBAA hex codes
      rgb_fn = true,    -- Enable CSS rgb() and rgba() functions
      hsl_fn = true,    -- Enable CSS hsl() and hsla() functions
      css = true,       -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true,    -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode = "background", -- Set the display mode. Available modes: foreground, background
    })
  end,
}
