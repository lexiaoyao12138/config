local vim = vim

local ok, buff_line = pcall(require, "bufferline")
if not ok then
	vim.notify("bufferline is not install!")
	return
end

vim.opt.termguicolors = true

buff_line.setup({
	highlights = {
		tab_selected = {
			-- fg = "#fcc444",
		}
	},

		options = {
		mode = "buffers",
		-- number = "both",
		buffer_close_icon = "",
		modified_icon = "ﴞ",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_default_icons = true,
		show_tab_indicators = true,
		diagnostics = "nvim_lsp",
		-- separator_style = {"", ""},
		-- enforce_regular_tabs = true,
		-- numbers = function(opts)
		-- 	return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
		-- end,
	},
})
