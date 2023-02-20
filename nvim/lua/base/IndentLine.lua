-- local vim = vim
--
-- local ok, indent_blankline = pcall(require, "indent_blankline")
-- if not ok then
-- 	vim.notify("indent_blankline is not install!")
-- 	return
-- end
--
-- vim.opt.listchars:append("space:⋅")
-- -- vim.opt.listchars:append("eol:↴")
--
-- indent_blankline.setup({
-- 	-- space_char_blankline = " ",
-- 	show_current_context = false,
-- 	show_end_of_line = true,
-- })

vim.cmd[[ 
	let g:hlchunk_files = '*.ts,*.js,*.json,*.go,*.c,*.cpp,*.cc,*.rs,*.h,*.hpp,*.lua'
	" let g:hlchunk_chars=['─', '─', '╭', '│', '╰', '─', '>']
	let g:hlchunk_chars=['─', '─', '┌', '│', '└', '─', '>']
	au VimEnter * hi HLIndentLine ctermfg=600
]]
