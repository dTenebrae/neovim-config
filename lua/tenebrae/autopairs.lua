-- =======================================
--        tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
        return
end

npairs.setup {
        check_ts = true,
        ts_config = {
                lua = { "string", "source" },
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        -- for wrapping words and so on with alt+e combination
        fast_wrap = {
                map = '<M-e>',
                chars = { '{', '[', '(', '"', "'" },
                pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                end_key = '$',
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                check_comma = true,
                highlight = 'Search',
                highlight_grey='Comment'
        },
}

-- autopairs for suggestions
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
        return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
