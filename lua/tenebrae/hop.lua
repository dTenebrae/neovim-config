local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

local directions = require('hop.hint').HintDirection

hop.setup { keys = 'etovxqpdygfblzhckisuran' }


vim.keymap.set('', 's', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})

vim.keymap.set('', 'S', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
