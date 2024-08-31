return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Disable LSP Semantic Highlighting globally
      vim.lsp.handlers["textDocument/semanticTokens/full"] = function() end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Common on_attach function for all LSP servers
      local on_attach = function(client, bufnr)
        -- Keybindings for LSP actions
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

        -- If using ESLint, add auto-fix on save
        if client.name == "eslint" then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end
      end

      -- LSP servers configuration
      lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.document_formatting = false
          client.server_capabilities.semanticTokensProvider = nil
          on_attach(client, bufnr)
        end,
      })

      -- ESLint LSP setup
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
}
