local ok, Leap = pcall(require, "leap")
if not ok then
	vim.notify("leap is not install!")
	return
end

Leap.add_default_mappings()

