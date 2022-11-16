local vim = vim


local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.keymap.set("n", "-c", ":HopChar1<CR>")
vim.keymap.set("n", "-l", ":HopLineStart<CR>")
vim.keymap.set("n", "-a", ":HopAnywhere<CR>")
vim.keymap.set("n", "fw", ":HopWord<CR>")
