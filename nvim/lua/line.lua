local ok, line = pcall(require, "lualine")
if not ok then
	vim.notify("lualine is not install!")
	return
end

line.setup({
	options = { theme = "gruvbox-material" },
})
