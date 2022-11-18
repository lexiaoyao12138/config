local vim = vim

vim.opt.termguicolors = true
require("notify").setup{
	timeout = 1000,
  background_colour = "#000000",
}
vim.cmd [[
	hi FoldColumn guibg=#31312D guifg=#526A83
	hi BookmarkSign guifg=#e9c911
	"highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
	"highlight BookmarkLine ctermbg=whatever ctermfg=whatever
	"highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever
]]

-- init.lua
local ok, _ = pcall(require, "notify")
if ok then
  vim.notify = require("notify")

end

vim.opt.number = true
vim.opt.wrap = false
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

vim.api.nvim_command(":set nobackup")
vim.api.nvim_command(":set nosplitright")
vim.api.nvim_command(":set clipboard+=unnamedplus")
vim.api.nvim_command(":set bg=dark")

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
		icons = {
			glyphs = {
				git = {
					untracked = "ﱐ"
				},
			},
		}
	},
})

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
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

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
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
-- require("bufferline_config")
require("tabline_config")
-- gittsigns
require("gittsigns")
--todo
require("todo")
--formatter
require("format")
-- indent-blankline
require("blankline")
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
require("lsp_age")
-- lualine
require("line")
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- require('nvim-lightbulb').setup({autocmd = {enabled = true}})
require("nvim-tree_config")
require("flod")
require("windows_config")
--
require("ill")
require("hop_config")

require("session")
-- require("golang")
-- require("renamer").setup {}
-- vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
require('keymap')
require('leap_config')
