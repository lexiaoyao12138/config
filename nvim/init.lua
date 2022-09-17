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

vim.api.nvim_command(":set bg=dark")
--vim.api.nvim_command(":colorscheme gruvbox-material")
vim.api.nvim_command(":colorscheme vscode")

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Up>", ":resize -1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Down>", ":resize +1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-]>", ":vertical resize +1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-[>", ":vertical resize -1<CR>", { noremap = true })
--nnoremap <S-Down> :resize +1<CR>
--nnoremap <S-Left> :vertical resize -1<CR>
--nnoremap <S-Right> :vertical resize +1<CR>

-- telescop map
vim.api.nvim_set_keymap("n", "ff", ":Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "fg", ":Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "fb", ":Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "fh", ":Telescope help_tags<cr>", { noremap = true })

require("plugins")

-- ==============================================================================
-- ==============================lspkind=========================================
-- ==============================================================================
require("lspkind").init({
	-- DEPRECATED (use mode instead): enables text annotations
	--
	-- default: true
	-- with_text = true,

	-- defines how annotations are shown
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

-- ==============================================================================
-- ==============================lspkind=========================================
-- ==============================================================================

-- ===============================================================================
-- =============================cmp setting ======================================
-- ===============================================================================
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})

-- ===============================================================================
-- =============================cmp setting ======================================
-- ===============================================================================

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.format, bufopts)
end

-- auto start language server
local servers = { "sumneko_lua", "clangd" } -- lsp-server
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
	})
end

require("mason").setup({ -- start mason config
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

local cfg = {
	toggle_key = "<c-g>",
	select_signature_key = "<c-n>",
}

-- function sign
require("lsp_signature").setup(cfg)

require("nvim-autopairs").setup({})

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "c", "lua", "make", "go", "cpp", "html", "css", "javascript", "vim" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})

-- =====================================================================================================
-- =====================================================================================================
-- =====================================================================================================
vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		mode = "buffers",
		number = "both",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_default_icons = true,
		show_tab_indicators = true,
		diagnostics = "nvim_lsp",
		indicator = {
			icons = "",
			style = "icon",
		},
	},
})
-- =.====================================================================================================
-- =====================================================================================================
-- =====================================================================================================

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
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Do not forget to use the on_attach function
--require 'lspconfig'.sumneko_lua.setup { handlers=handlers }

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = { Error = "", Warn = "", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	--virtual_text = {
	--  prefix = '', -- Could be '●', '▎', 'x'
	--}
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


-- debug
vim.api.nvim_set_keymap("n", "BB",
	":lua require'dap'.toggle_breakpoint()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-s", "<cmd>lua require'dap'.step_into()<cr>", { noremap = true })
