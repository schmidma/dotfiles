" -> fzf.vim
" fzf for vim. fzf.vim depends on the basic Vim plugin of the main fzf repository, which means you need to set up both 'fzf' and 'fzf.vim' on Vim.
Plug 'junegunn/fzf.vim'

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
nnoremap <silent> <leader>e :FZF<CR>
