local ok, git_theme = pcall(require, "github-theme")
if not ok then
	vim.notify("git_theme is not install!")
	return
end

-- vim.api.nvim_command(":colorscheme gruvbox-material")
-- vim.api.nvim_command(":colorscheme vscode")


git_theme.setup({
	comment_style = "italic",
  keyword_style = "italic",
  function_style = "italic",
  variable_style = "italic",
	theme_style = "dark_colorblind",
	sidebars = { "qf", "vista_kind", "terminal", "packer" },

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	colors = { hint = "orange", error = "#ff0000" },

	-- Overwrite the highlight groups
	overrides = function(c)
		return {
			htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
			DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
			-- this will remove the highlight groups
			TSField = {},
		}
	end
})
