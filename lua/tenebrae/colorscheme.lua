-- =======================================
--        tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
--local colorscheme = "gruvbox-baby"

--local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--if not status_ok then
        --return
--end

local status_ok, rose_pine = pcall(require, "rose-pine")
if not status_ok then
        return
end

rose_pine.setup({
        disable_italics = true
})

vim.cmd('colorscheme rose-pine')
