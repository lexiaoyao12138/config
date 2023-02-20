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
vim.g.gruvbox_material_current_word="italic"
vim.api.nvim_command(":colorscheme gruvbox-material")


-- github
-- require('github-theme').setup({
-- 	theme_style = "dark",
-- 	comment_style = "italic",
-- 	keyword_style = "bold",
--   function_style = "bold",
--   variable_style = "nocombine",
-- 	sidebars = { "qf", "vista_kind", "terminal", "packer" },
--
-- 	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- 	colors = { hint = "orange", error = "#ff0000" },
--
-- 	-- Overwrite the highlight groups
-- 	overrides = function(c)
-- 		return {
-- 			htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "bold" },
-- 			DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
-- 			-- this will remove the highlight groups
-- 			TSField = {},
-- 		}
-- 	end
-- })

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = false, fg = '#B39148', bold = true },
    functions = { italic = false, bold = true },
    variables = { fg = '#9cdcfe' },
    -- Background styles. Can be "dark", "transparent" or "normal"
    -- sidebars = "transparent", -- style for sidebars, see below
		Background = "transparent",
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "help", "terminal", "vista_kind"  }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.9, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
 })


-- require('onedark').setup  {
--     -- Main options --
--     style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = true,  -- Show/hide background
--     term_colors = true, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'bold',
--         strings = 'none',
--         variables = 'none'
--     },
--
--     -- Lualine options --
--     lualine = {
--         transparent = false, -- lualine center bar transparency
--     },
--
--     -- Plugins Config --
--     diagnostics = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = false,   -- use undercurl instead of underline for diagnostics
--         background = false,    -- use background color for virtual text
--     },
-- }
-- require('onedark').load()
vim.cmd[[
	colorscheme tokyonight
]]
