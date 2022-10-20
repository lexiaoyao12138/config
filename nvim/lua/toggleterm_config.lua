local vim = vim

local ok, term = pcall(require, "toggleterm")
if not ok then
	vim.notify("todo-comments is not install!!")
	return
end

-- toggle_preview
term.setup({
	open_mapping = [[<c-\>]],
	-- direction = "vertical",
	direction = "horizontal",
	shade_terminals = false,
	float_opts = {
		border = "curved",
	},
})

