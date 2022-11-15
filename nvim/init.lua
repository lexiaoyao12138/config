local vim = vim

vim.opt.termguicolors = true
require("notify").setup{
	timeout = 1000,
  background_colour = "#000000",
}
vim.cmd [[
highlight NotifyERRORBorder guifg=#8A1F1F
highlight NotifyWARNBorder guifg=#79491D
highlight NotifyINFOBorder guifg=#4F6752
highlight NotifyDEBUGBorder guifg=#8B8B8B
highlight NotifyTRACEBorder guifg=#4F3552
highlight NotifyERRORIcon guifg=#F70067
highlight NotifyWARNIcon guifg=#F79000
highlight NotifyINFOIcon guifg=#A9FF68
highlight NotifyDEBUGIcon guifg=#8B8B8B
highlight NotifyTRACEIcon guifg=#D484FF
highlight NotifyERRORTitle  guifg=#F70067
highlight NotifyWARNTitle guifg=#F79000
highlight NotifyINFOTitle guifg=#A9FF68
highlight NotifyDEBUGTitle  guifg=#8B8B8B
highlight NotifyTRACETitle  guifg=#D484FF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal
hi FoldColumn guibg=#31312D guifg=#526A83
highlight BookmarkSign guifg=#e9c911
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

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Up>", ":resize -1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Down>", ":resize +1<CR>", { noremap = true })
vim.keymap.set("n", "<c-]>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<c-m>", ":vertical resize +3<CR>")
vim.api.nvim_set_keymap("n", "<Esc>", "<Esc>", { noremap = true })
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
-- keymap
-- vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "gl", ":Lspsaga show_line_diagnostics<CR>")
-- vim.keymap.set("n", "<space>f", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.api.nvim_set_keymap("n", "[b", ":BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "]b", ":BufferLineCyclePrev<CR>", { noremap = true })


vim.api.nvim_set_keymap("n", "<c-/>", "<Plug>kommentary_line_default", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", { noremap = true })
-- vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", { noremap = true })

-- nvimtree
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", { noremap = true })


-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)


-- debug
vim.api.nvim_set_keymap("n", "BB",
  ":lua require'dap'.toggle_breakpoint()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-s", "<cmd>lua require'dap'.step_into()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-v", "<cmd>lua require'dap'.step_over()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "-u", "<cmd>lua require'dap'.step_out()<cr>", { noremap = true })

-- require("renamer").setup {}
-- vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-- 添加头部信息
vim.cmd [[
autocmd BufNewFile *.[ch],*.hpp,*.cc,Makefile,*.mk,*.sh exec ":call SetTitle()"
func SetComment()
        call setline(1,"/*================================================================")
        call append(line("."),   "*   Copyright (C) ".strftime("%Y")." IEucd Inc. All rights reserved.")
        call append(line(".")+1, "*   ")
        call append(line(".")+2, "*   文件名称：".expand("%:t"))
        call append(line(".")+3, "*   创 建 者：lexiaoyao12138")
        call append(line(".")+4, "*   创建日期：".strftime("%Y年%m月%d日"))
        call append(line(".")+5, "*   描    述：")
        call append(line(".")+6, "*")
        call append(line(".")+7, "================================================================*/")
        call append(line(".")+8, "")
        call append(line(".")+9, "")
endfunc
func SetComment_sh()
        call setline(3, "#================================================================")
        call setline(4, "#   Copyright (C) ".strftime("%Y")." IEucd Inc. All rights reserved.")
        call setline(5, "#   ")
        call setline(6, "#   文件名称：".expand("%:t"))
        call setline(7, "#   创 建 者：SongTL, songtianlun@comleader.com.cn")
        call setline(8, "#   创建日期：".strftime("%Y年%m月%d日"))
        call setline(9, "#   描    述：")
        call setline(10, "#")
        call setline(11, "#================================================================")
        call setline(12, "")
        call setline(13, "")
endfunc
func SetTitle()
        if &filetype == 'make'
                call setline(1,"")
                call setline(2,"")
                call SetComment_sh()

        elseif &filetype == 'sh'
                call setline(1,"#!/system/bin/sh")
                call setline(2,"")
                call SetComment_sh()

        else
             call SetComment()
             if expand("%:e") == 'hpp'
                  call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H")
                  call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H")
                  call append(line(".")+12, "#endif")
                  call append(line(".")+13, "#endif //".toupper(expand("%:t:r"))."_H")

             elseif expand("%:e") == 'h'
                call append(line(".")+10, "#pragma once")
             elseif &filetype == 'c'
                call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
             elseif &filetype == 'cpp'
                call append(line(".")+10, "#include \"".expand("%:t:r").".h\"")
             endif
        endif
endfun
]]
