-- =======================================
--        tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
local colorscheme = "gruvbox-flat"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
        vim.notify("colorscheme " .. colorscheme .. " not found!")
        return
end
