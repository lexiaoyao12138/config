local ok, ls = pcall(require, "luasnip")
if not ok then
	vim.notify("luasnip is not install!")
	return
end


require("luasnip.loaders.from_vscode").lazy_load({paths = {"~/.local/share/nvim/site/pack/packer/start/friendly-snippets"}})
