return {
  "echasnovski/mini.nvim",
  config = function()
    -- Setup for mini.move
    require("mini.move").setup({
      mappings = {
        left = "<C-M-h>",   -- Move selection left
        right = "<C-M-l>",  -- Move selection right
        down = "<C-M-j>",   -- Move selection down
        up = "<C-M-k>",     -- Move selection up
        line_left = "<C-M-h>", -- Move line left
        line_right = "<C-M-l>", -- Move line right
        line_down = "<C-M-j>", -- Move line down
        line_up = "<C-M-k>", -- Move line up
      },
    })

    -- Setup for mini.pairs
    require("mini.pairs").setup({})
  end,
}
