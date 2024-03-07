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
    local languages = {
      dockerfile = {
        require('efmls-configs.linters.hadolint'),
      },
      go = {
        require("efmls-configs.formatters.gofumpt"),
        require("efmls-configs.formatters.goimports"),
        require("efmls-configs.formatters.golines"),
      },
      javascript = {
        require("efmls-configs.linters.eslint_d"),
        require("efmls-configs.formatters.prettier_d"),
      },
      markdown = {
        require('efmls-configs.linters.markdownlint'),
        require('efmls-configs.formatters.mdformat'),
      },
      python = {
        require('efmls-configs.linters.mypy'),
        require('efmls-configs.formatters.ruff'),
      },
      terraform = {
        require('efmls-configs.formatters.terraform_fmt'),
      },
      typescript = {
        require("efmls-configs.linters.eslint_d"),
        require("efmls-configs.formatters.prettier_d"),
      },
      typescriptreact = {
        require("efmls-configs.linters.eslint_d"),
        require("efmls-configs.formatters.prettier_d"),
      },
      yaml = {
        require("efmls-configs.formatters.prettier_d"),
        require('efmls-configs.linters.yamllint')
      },
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
      filetypes = vim.tbl_keys(languages),
      on_attach = require("lsp-format").on_attach,
      init_options = { documentformatting = true },
      settings = {
        languages = languages,
      },
    })
  end,
}
