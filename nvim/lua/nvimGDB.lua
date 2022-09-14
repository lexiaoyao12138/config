vim.cmd([[
    let g:nvimgdb_disable_start_keymaps = 1
    let g:nvimgdb_use_find_executables = 0
    let g:nvimgdb_use_cmake_to_find_executables = 0
    let w:nvimgdb_termwin_command = "rightbelow vnew"
    let w:nvimgdb_codewin_command = "vnew"
    let g:nvimgdb_config_override = {
      \ 'key_next': '-n',
      \ 'key_step': '-s',
      \ 'key_finish': '-f',
      \ 'key_continue': '-c',
      \ 'key_until': '-u',
      \ 'key_breakpoint': '-b',
  \ }
]])
