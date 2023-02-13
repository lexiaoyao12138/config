local vim = vim

vim.opt.termguicolors = true
vim.cmd [[
	hi FoldColumn guibg=#31312D guifg=#526A83
	hi BookmarkSign guifg=#e9c911
	"highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
	"highlight BookmarkLine ctermbg=whatever ctermfg=whatever
	"highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever
]]

-- init.lua
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
vim.api.nvim_command(":set noswapfile")
vim.api.nvim_command(":set nosplitright")
vim.api.nvim_command(":set clipboard+=unnamedplus")
vim.api.nvim_command(":set bg=dark")

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


require("plugins")
require("Notify")
require("base")

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

-- require("autoSave")
require("colorizer").setup()
-- 顶部状态栏
-- require("tabline_config")
-- nvimGDB
require("nvimGDB")
--comment
require("comment")

--dap
require("nvim-dap")

--theme
require("theme")

require("snippet")
require("lsp_cmp")
require("lsp_config")
require("lsp_age")
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- require('nvim-lightbulb').setup({autocmd = {enabled = true}})
require("nvim-tree_config")
require("ill")

require('keymap')
require("aerial_config")
