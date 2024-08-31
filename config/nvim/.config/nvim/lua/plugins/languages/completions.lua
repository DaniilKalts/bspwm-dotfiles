return {
  -- LSP completion source
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  -- Snippet engine and predefined snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",  -- Integration with nvim-cmp
      "rafamadriz/friendly-snippets", -- Predefined snippets
    },
  },

  -- Autocompletion framework
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path", -- Path completions
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Expand the snippet using LuaSnip
          end,
        },
        window = {
          completion = cmp.config.window.bordered(), -- Bordered completion window
          documentation = cmp.config.window.bordered(), -- Bordered documentation window
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-S-j>"] = cmp.mapping.select_next_item(), -- Navigate to the next item
          ["<C-S-k>"] = cmp.mapping.select_prev_item(), -- Navigate to the previous item
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm the selection
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP completions
          { name = "luasnip" }, -- Snippet completions
          { name = "path" }, -- Path completions
        }),
      })
    end,
  },
}
