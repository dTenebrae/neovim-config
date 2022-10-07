local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
        print("lspconfig not found")
        return
end

require("tenebrae.lsp.lsp-installer")
require("tenebrae.lsp.handlers").setup()
