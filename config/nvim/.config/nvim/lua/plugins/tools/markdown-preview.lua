return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install", -- Install dependencies
    config = function()
      vim.g.mkdp_auto_start = 1    -- Auto start preview on entering a Markdown file
    end,
  },
}
