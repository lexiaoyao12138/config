local ok, ls = pcall(require, "luasnip")
if not ok then
	vim.notify("luasnip is not install!")
	return
end


require("luasnip.loaders.from_vscode").lazy_load(--[[ {paths = {"~/.local/share/nvim/site/pack/packer/start/friendly-snippets"}} ]] )

vim.cmd [[
		imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
		inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
		
		snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
		snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
		
		imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
		smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]
