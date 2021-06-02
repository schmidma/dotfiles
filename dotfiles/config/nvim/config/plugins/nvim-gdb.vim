" -> nvim-gdb
" Neovim thin wrapper for GDB, LLDB and PDB.
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'key_eval': 'p',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ 'split_command': 'split'
  \ }
