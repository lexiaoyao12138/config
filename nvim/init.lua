local vim = vim
-- init.lua
local ok, _ = pcall(require, "notify")
if ok then
	vim.notify = require("notify")
end

vim.opt.number = true
vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.hls = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
-- set bookmarks icon
vim.cmd [[ 
	let g:bookmark_sign="⛳"
]]

vim.api.nvim_command(":set nobackup")
vim.api.nvim_command(":set nosplitright")
vim.api.nvim_command(":set clipboard+=unnamedplus")
vim.api.nvim_command(":set bg=dark")

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Up>", ":resize -1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Down>", ":resize +1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-]>", ":vertical resize -1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-[>", ":vertical resize +1<CR>", { noremap = true })
-- 右侧的函数列表
vim.api.nvim_set_keymap("n", "<c-l>", ":LSoutlineToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-s>", ":SymbolsOutline<CR>", { noremap = true })

require("plugins")
require("lspkind").init({
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "symbol_text",

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = "codicons",

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})


require("mason").setup({ -- start mason config
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

require("nvim-autopairs").setup({
	check_ts = true,
})

require("nvim-tree").setup({
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

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)

-- Do not forget to use the on_attach function
--require 'lspconfig'.sumneko_lua.setup { handlers=handlers }

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = { Error = "", Warn = "👀", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	-- 关闭右侧的诊断信息
	virtual_text = false,
})

-- toggle_preview
require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	shade_terminals = false,
	float_opts = {
		border = "curved",
	},
})

vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<space>f", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.api.nvim_set_keymap("n", "gt1", ":BufferLineGoToBuffer 1<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gt2", ":BufferLineGoToBuffer 2<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gt3", ":BufferLineGoToBuffer 3<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gt4", ":BufferLineGoToBuffer 4<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gt5", ":BufferLineGoToBuffer 5<cr>", { noremap = true })

require("colorizer").setup()

vim.api.nvim_set_keymap("n", "<c-/>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})

-- nvimtree
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", { noremap = true })


vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)

-- 顶部状态栏
require("bufferline_config")
-- gittsigns
require("gittsigns")
--todo
require("todo")
--formatter
-- require("format")
-- indent-blankline
require("blankline")
-- lualine
require("line")
-- nvimGDB
require("nvimGDB")
--symbols-outline
require("symbols")
--comment
require("comment")

--dap
require("nvim-dap")

--theme
require("theme")

require("lsp_age")

require("telescope_config")

require("snippet")
require("lsp_cmp")
require("lsp_config")
-- require('nvim-lightbulb').setup({autocmd = {enabled = true}})
require("nvim-tree_config")
require("flod")


-- debug
vim.api.nvim_set_keymap("n", "BB",
	":lua require'dap'.toggle_breakpoint()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-s", "<cmd>lua require'dap'.step_into()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-v", "<cmd>lua require'dap'.step_over()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-u", "<cmd>lua require'dap'.step_out()<cr>", { noremap = true })

require("renamer").setup {}
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
