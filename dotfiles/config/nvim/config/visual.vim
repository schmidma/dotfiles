" === Visual Settings ===

syntax on
set ruler
set number relativenumber

set background=dark

" Split below and right
set splitbelow
set splitright

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=15

" Status bar (display always)
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" always show signcolumns
set signcolumn=yes

let no_buffers_menu=1

" enable true colors support
set termguicolors

" Access colors present in 256 colorspace
let base16colorspace=256

" base16 colorscheme
colorscheme base16-default-dark

" hightlight semantics of CocNvim more clear
highlight CocHighlightText cterm=bold gui=bold
