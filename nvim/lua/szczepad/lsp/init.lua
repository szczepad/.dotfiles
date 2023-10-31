local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "szczepad.lsp.mason"
require("szczepad.lsp.handlers").setup()
require("szczepad.lsp.null-ls")
