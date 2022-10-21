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
-- vim.cmd [[
-- 	let g:bookmark_sign="⛳"
-- ]]

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
-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	-- 关闭右侧的诊断信息
	virtual_text = false,
})


require("colorizer").setup()
require("toggleterm_config")
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

require("telescope_config")

require("snippet")
require("lsp_cmp")
require("lsp_config")
-- require('nvim-lightbulb').setup({autocmd = {enabled = true}})
require("nvim-tree_config")
require("flod")
require("windows_config")

-- keymap
vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<space>f", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.api.nvim_set_keymap("n", "[b", ":BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "b[", ":BufferLineCyclePrev<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gt5", ":BufferLineGoToBuffer 5<cr>", { noremap = true })


vim.api.nvim_set_keymap("n", "<c-/>", "<Plug>kommentary_line_default", { noremap = true })
vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", { noremap = true })
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", { noremap = true })

-- nvimtree
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", { noremap = true })


vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)


-- debug
vim.api.nvim_set_keymap("n", "BB",
	":lua require'dap'.toggle_breakpoint()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-s", "<cmd>lua require'dap'.step_into()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-v", "<cmd>lua require'dap'.step_over()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-u", "<cmd>lua require'dap'.step_out()<cr>", { noremap = true })

require("renamer").setup {}
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
