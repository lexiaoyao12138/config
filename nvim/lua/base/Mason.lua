local ok, Mason = pcall(require, "mason")
if not ok then
	vim.notify("mason is not install")
	return
end

Mason.setup({ -- start mason config
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  },
})
