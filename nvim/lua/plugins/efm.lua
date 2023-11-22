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
    local prettier_d = require("efmls-configs.linters.eslint_d")
    local eslint_d = require("efmls-configs.formatters.prettier_d")

    local gofumpt = require("efmls-configs.formatters.gofumpt")
    local goimports = require("efmls-configs.formatters.goimports")
    local golines = require("efmls-configs.formatters.golines")

    local rustfmt = require("efmls-configs.formatters.rustfmt")

    local languages = {
      javascript = {
        linter = eslint_d,
        formatter = prettier_d,
      },
      go = {
        {formatter = gofumpt},
        {formatter = goimports},
        {formatter = golines},
      },
      rust = {
        {formatter = rustfmt},
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

    -- This is really useful! See available options `:h vim.lsp`
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end,
    })

    -- Server setup here
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    lspconfig.tsserver.setup({})

    lspconfig.efm.setup({
      filetypes = { "typescript", "javascript","typescriptreact","javascriptreact","javascript.jsx","javascript.tsx","go" },
      on_attach = require("lsp-format").on_attach,
      init_options = { documentformatting = true },
      settings = {
        languages = {
          typescript = { prettier_d },
          typescriptreact = { prettier_d },
          go = { gofumpt, goimports,golines },
          rust = {rustfmt},
        },
      },
    })
  end,
}
