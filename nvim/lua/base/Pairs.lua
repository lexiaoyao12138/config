local ok, pair = pcall(require, "nvim-autopairs")
if not ok then
	vim.notify("nvim-autopairs is not install!")
	return
end

pair.setup({
  check_ts = true,
})
