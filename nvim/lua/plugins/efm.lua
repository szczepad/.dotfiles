return {
  "creativenull/efmls-configs-nvim",
  dependencies = {
    { "lukas-reineke/lsp-format.nvim" },
    { "neovim/nvim-lspconfig" },
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local efmls = require("efmls-configs")
    -- Your formatters and linters
    -- https://github.com/creativenull/efmls-configs-nvim/blob/main/doc/SUPPORTED_LIST.md
    local eslint_d = require("efmls-configs.linters.eslint_d")
    local prettier_d = require("efmls-configs.formatters.prettier_d")

    local gofumpt = require("efmls-configs.formatters.gofumpt")
    local goimports = require("efmls-configs.formatters.goimports")
    local golines = require("efmls-configs.formatters.golines")

    local rustfmt = require("efmls-configs.formatters.rustfmt")

    local markdownlint = require('efmls-configs.linters.markdownlint')

    local languages = {
      javascript = {
        {linter = eslint_d},
        {formatter = prettier_d},
      },
      typescript = {
        linter = eslint_d,
        formatter = prettier_d,
      },
      typescriptreact = {
        linter = eslint_d,
        formatter = prettier_d,
      },
      go = {
        {formatter = gofumpt},
        {formatter = goimports},
        {formatter = golines},
      },
      markdown = {
        {linter = markdownlint},
        {formatter = markdownlint},
      }
    }

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { '.git/' },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      }
    }

    require('lspconfig').efm.setup(vim.tbl_extend('force',efmls_config,{}))

    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buffer,
        callback = function()
            vim.lsp.buf.format { async = false }
        end
    })
    -- Server setup here
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    lspconfig.tsserver.setup({})

    lspconfig.efm.setup({
      filetypes = { "typescript", "javascript","typescriptreact","javascriptreact","javascript.jsx","javascript.tsx","go","markdown"},
      on_attach = require("lsp-format").on_attach,
      init_options = { documentformatting = true },
      settings = {
        languages = {
          typescript = { prettier_d },
          typescriptreact = { prettier_d },
          go = { gofumpt, goimports,golines },
          rust = {rustfmt},
          markdown = {markdownlint},
        },
      },
    })
  end,
}
