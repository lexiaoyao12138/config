local vim = vim

vim.g.gruvbox_material_background = "medium" -- hard medium soft
vim.g.gruvbox_material_foreground = "original" -- material mix original
-- vim.g.gruvbox_material_disable_italic_comment=1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_statusline_style = 1
vim.g.gruvbox_material_lightline_disable_bold = 1
-- vim.g.gruvbox_material_current_word="italic"
vim.api.nvim_command(":colorscheme gruvbox-material")
