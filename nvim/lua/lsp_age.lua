local keymap = vim.keymap.set
local ok, saga = pcall(require, 'lspsaga')
if not ok then
	vim.notify("lspsage is not install!")
	return
end

saga.init_lsp_saga({
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "rounded",
	code_action_lightbulb = {
		enable = true,
		enable_in_insert = true,
		cache_code_action = true,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = false,
	},
	show_outline = {
		win_with = 'db_ui',
		win_width = 40,
	},
	diagnostic_header = { " ", " ", " ", "ﴞ " },
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<space>ca", ":Lspsaga code_action<CR>", { silent = true })

--rename
keymap("n", "<space>rn", ":Lspsaga rename<CR>", {silent = true})
keymap("n", "<c-k>", ":Lspsaga hover_doc<CR>", {silent = true})
