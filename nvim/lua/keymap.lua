local vim = vim

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Up>", ":resize -1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-Down>", ":resize +1<CR>", { noremap = true })
vim.keymap.set("n", "<c-]>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<c-m>", ":vertical resize +3<CR>")
vim.api.nvim_set_keymap("n", "<Esc>", "<Esc>", { noremap = true })
-- 右侧的函数列表
vim.api.nvim_set_keymap("n", "<c-l>", ":LSoutlineToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-s>", ":SymbolsOutline<CR>", { noremap = true })

-- keymap
-- vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "gl", ":Lspsaga show_line_diagnostics<CR>")
-- vim.keymap.set("n", "<space>f", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
-- vim.api.nvim_set_keymap("n", "[b", ":BufferLineCycleNext<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "]b", ":BufferLineCyclePrev<CR>", { noremap = true })
vim.keymap.set('n', '<Tab>', ':TablineBufferNext<CR>')
-- vim.keymap.set('n', '')
-- vim.keymap.set("n", "<s-tab>", ":CybuLastusedPrev<CR>")
-- vim.keymap.set("n", "<tab>", ":CybuNext<CR>")
vim.cmd[[ :nnoremap ;q :Bdelete<CR> ]]

vim.keymap.set('n', 'Lg', ':LazyGit<CR>')

-- vim.api.nvim_set_keymap("n", "<c-/>", "<Plug>kommentary_line_default", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", { noremap = true })
-- vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-f>", ":ToggleTerm direction=float<CR>", {noremap = true })
vim.api.nvim_set_keymap("n", "<c-\\>", ":ToggleTerm direction=horizontal<CR>", {noremap = true })

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
                  call append(line(".")+12, "#endif //".toupper(expand("%:t:r"))."_H")

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
