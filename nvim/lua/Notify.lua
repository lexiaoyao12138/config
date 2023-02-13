local ok, _notify = pcall(require, "notify")
if not ok then
	return
end

vim.notify = _notify
