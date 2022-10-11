-- =======================================
--        tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
        print("lspconfig not found")
        return
end

require("tenebrae.lsp.lsp-installer")
require("tenebrae.lsp.handlers").setup()
