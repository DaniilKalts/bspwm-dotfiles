return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- JavaScript/TypeScript/HTML/CSS formatting
        null_ls.builtins.formatting.prettier,

        -- Lua formatting
        null_ls.builtins.formatting.stylua,

        -- Go formatting and linting
        null_ls.builtins.formatting.goimports,  -- Go formatting
        null_ls.builtins.diagnostics.golangci_lint, -- Go linting

        -- Python formatting and linting
        null_ls.builtins.formatting.black,   -- Python formatting
        null_ls.builtins.diagnostics.flake8, -- Python style and error checking
        null_ls.builtins.diagnostics.mypy,   -- Python type checking
        null_ls.builtins.diagnostics.pydocstyle, -- Python docstring style checking
        null_ls.builtins.formatting.isort,   -- Python import sorting and removal of unused imports

        -- JavaScript/TypeScript linting
        null_ls.builtins.diagnostics.eslint, -- JavaScript/TypeScript linting

        -- Bash formatting with beautysh
        null_ls.builtins.formatting.beautysh,

        -- Bash formatting with shfmt
        null_ls.builtins.formatting.shfmt,

        -- Configuration files formatting (JSON, YAML, Markdown, etc.)
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "json", "yaml", "markdown" }, -- Add any other config files as needed
        }),
      },
    })

    -- Keybinding for formatting
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format code" })

    -- Auto-format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
      desc = "Auto format on save",
    })
  end,
}
