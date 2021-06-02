" === Basic Setup ===

" font
set guifont=Source\ Code\ Pro,Dejavu\ Sans:h15

" mouse all modes
set mouse=a

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Fix backspace indent
set backspace=indent,eol,start

" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to space
let mapleader=' '

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set inccommand=nosplit
set ignorecase
set smartcase

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" smaller update time for git gutter and Hover of coc
set updatetime=100

" Directories for swp files
set nobackup
set nowritebackup
set noswapfile

set fileformats=unix,dos,mac

set shell=$SHELL

set autoread

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Disable python2
let g:loaded_python_provider = 0

" neovide
let g:neovide_cursor_antialiasing=v:true
let g:neovide_refresh_rate=60
let g:neovide_transparency=0.9
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_trail_length=0.8

