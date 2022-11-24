local ok, tree = pcall(require, "nvim-tree")
if not ok then
	vim.notify("nvim-tree is not install!")
	return
end

tree.setup({
  view = {
    side = "left",
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
  },
})
