-- =======================================
--        tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

local directions = require('hop.hint').HintDirection

hop.setup { keys = 'etovxqpdygfblzhckisuran' }


vim.keymap.set('n', 's', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})

vim.keymap.set('n', 'S', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
