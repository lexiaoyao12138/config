local vim = vim

local config = function()
	vim.o.winwidth = 10
	vim.o.winminwidth = 10
	vim.o.equalalways = true
end

-- 动态调整窗口大小
require('windows').setup({
	config = config,
	ignore = {
      buftype = { "quickfix",  },
      filetype = { "NvimTree", "Outline" }
   },
})

-- 移动窗口
require("winshift").setup({
	highlight_moving_win = true, -- Highlight the window being moved
	focused_hl_group = "Visual", -- The highlight group used for the moving window
	moving_win_options = {
		-- These are local options applied to the moving window while it's
		-- being moved. They are unset when you leave Win-Move mode.
		wrap = false,
		cursorline = false,
		cursorcolumn = false,
		colorcolumn = "",
	},
	keymaps = {
		disable_defaults = false, -- Disable the default keymaps
		win_move_mode = {
			["h"] = "left",
			["j"] = "down",
			["k"] = "up",
			["l"] = "right",
			["H"] = "far_left",
			["J"] = "far_down",
			["K"] = "far_up",
			["L"] = "far_right",
			["<left>"] = "left",
			["<down>"] = "down",
			["<up>"] = "up",
			["<right>"] = "right",
			["<S-left>"] = "far_left",
			["<S-down>"] = "far_down",
			["<S-up>"] = "far_up",
			["<S-right>"] = "far_right",
		},
	},
	---A function that should prompt the user to select a window.
	---
	---The window picker is used to select a window while swapping windows with
	---`:WinShift swap`.
	---@return integer? winid # Either the selected window ID, or `nil` to
	---   indicate that the user cancelled / gave an invalid selection.
	window_picker = function()
		return require("winshift.lib").pick_window({
			-- A string of chars used as identifiers by the window picker.
			picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
			filter_rules = {
				-- This table allows you to indicate to the window picker that a window
				-- should be ignored if its buffer matches any of the following criteria.
				cur_win = true, -- Filter out the current window
				floats = true, -- Filter out floating windows
				filetype = {}, -- List of ignored file types
				buftype = {}, -- List of ignored buftypes
				bufname = {}, -- List of vim regex patterns matching ignored buffer names
			},
			---A function used to filter the list of selectable windows.
			---@param winids integer[] # The list of selectable window IDs.
			---@return integer[] filtered # The filtered list of window IDs.
			filter_func = nil,
		})
	end,
})

vim.keymap.set("n", "mw", ":WinShift<CR>", { noremap = true })
vim.keymap.set("n", "ms", ":WinShift swap<CR>", { noremap = true })

-- 平滑滚动
require('neoscroll').setup({
    easing_function = "quadratic" -- Default easing function
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}
-- Use the "circular" easing function
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)
