" -> tagbar
" Vim plugin that displays tags in a window, ordered by scope.
Plug 'majutsushi/tagbar'

let g:tagbar_autofocus = 1
nnoremap <silent> <F4> :TagbarToggle<CR>
