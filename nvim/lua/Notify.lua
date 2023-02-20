local ok, _notify = pcall(require, "notify")
if not ok then
	return
end

_notify.setup({
	background_colour = "#000000"
})

vim.notify = _notify
