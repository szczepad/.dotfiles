local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require("szczepad.lsp.handlers").on_attach,
      capabilities = require("szczepad.lsp.handlers").capabilities,
    }

    server:setup(opts)
end)
