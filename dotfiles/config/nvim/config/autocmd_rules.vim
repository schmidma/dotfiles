" === Autocmd Rules ===

" Remember cursor position
augroup remember_cursor_position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup spelllang_mail
    autocmd!
    autocmd FileType mail setlocal spell
    autocmd FileType mail setlocal spelllang=en,de
augroup END

" c, cpp
augroup filetype_cpp
    autocmd!
    autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab commentstring=//\ %s
augroup END

" markdown
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

" html files, 2 spaces
augroup filetype_html
    autocmd!
    autocmd Filetype html setlocal ts=2 sw=2 expandtab
augroup END

" vim-javascript
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" python
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END
