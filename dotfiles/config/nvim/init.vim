
" === Basic Setup ===  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{

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

" }}}}}}}}}}}}}}}}}}}}}}}}}}}}} Basic Setup


" === Functions ===  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" toggle source header function
function ToggleSourceHeader()
    let extension = expand('%:e')
    if(extension == "hpp")
        let file = expand('%:r') . '.cpp'
        if filereadable(file)
            execute ":e %:r.cpp"
        endif
    elseif(extension == "h")
        let file = expand('%:r') . '.cpp'
        if filereadable(file)
            execute ":e %:r.cpp"
        endif
    elseif(extension == "cpp")
        let file = expand('%:r') . '.hpp'
        if filereadable(file)
            execute ":e %:r.hpp"
        endif
        let file = expand('%:r') . '.h'
        if filereadable(file)
            execute ":e %:r.h"
        endif
     endif
endfunc

" }}}}}}}}}}}}}}}}}}}}}}}}}}}}} Functions


" === Abbreviations ===  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" }}}}}}}}}}}}}}}}}}}}}}}}}}}}} Abbreviations


" === Autocmd Rules ===  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{

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

" }}}}}}}}}}}}}}}}}}}}}}}}}}}}} Autocmd Rules


" === Mappings ===  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{

" Navigate properly when lines are wrapped
map <silent> j gj
map <silent> k gk

" leader save
nnoremap <leader>w :w<CR>

" Toggle relative numbering
nnoremap <silent><F5> :set relativenumber!<CR>

" Terminal mode escape
tnoremap <Esc> <C-\><C-n>

" Split
noremap <Leader>sh :<C-u>split<CR>
noremap <Leader>sv :<C-u>vsplit<CR>

" Tabs
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <silent><leader>t :tabnew<CR>
nnoremap <leader>x :tabclose<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Buffer navigation
noremap <silent> <leader>j :bp<CR>
noremap <silent> <leader>k :bn<CR>

" Close buffer
noremap <leader>c :bd<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" visual selection A to work as expected
vnoremap A :'<,'>normal A

" }}}}}}}}}}}}}}}}}}}}}}}}}}}}} Mappings


" === Plugins ===  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{

call plug#begin()

" -> nerdtree  {{{
" A tree explorer for vim.
Plug 'scrooloose/nerdtree'

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" }}} nerdtree

" -> vim-commentary  {{{
" comment stuff out
Plug 'tpope/vim-commentary'


" }}} vim-commentary

" -> vim-airline  {{{
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" }}} vim-airline

" -> vim-airline-themes  {{{
" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='base16_default'

" }}} vim-airline-themes

" -> grep  {{{
" Grep search tools integration.
Plug 'vim-scripts/grep.vim'

" }}} grep

" -> DoxygenToolkit  {{{
" Simplify Doxygen documentation in C, C++, Python.
Plug 'vim-scripts/DoxygenToolkit.vim'

" }}} DoxygenToolkit

" -> vim-trailing-whitespace  {{{
" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'

" }}} vim-trailing-whitespace

" -> vim-visual-star-search  {{{
" Start a * or # search from a visual block
Plug 'nelstrom/vim-visual-star-search'

" }}} vim-visual-star-search

" -> tagbar  {{{
" Vim plugin that displays tags in a window, ordered by scope.
Plug 'majutsushi/tagbar'

let g:tagbar_autofocus = 1
nnoremap <silent> <F4> :TagbarToggle<CR>

" }}} tagbar

" -> vim-indent-object  {{{
" Vim plugin that defines a new text object representing lines of code at the same indent level.
Plug 'michaeljsmith/vim-indent-object'

" }}} vim-indent-object

" -> clever-f  {{{
" Extended f, F, t and T key mappings for Vim.
Plug 'rhysd/clever-f.vim'


let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 3000

" }}} clever-f

" -> vim-closer  {{{
" Closes brackets. Perfect companion to vim-endwise. Basically, a more conservative version of auto-pairs that only works when you press Enter.
Plug 'rstacruz/vim-closer'

" }}} vim-closer

" -> vim-surround  {{{
" Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

" }}} vim-surround

" -> vim-swap  {{{
" A Vim text editor plugin to swap delimited items. Reorder delimited items.
Plug 'machakann/vim-swap'

" }}} vim-swap

" -> coc.nvim  {{{
" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}


"debug coc.nvim
"let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <c-space> <Plug>(coc-diagnostic-info)


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rr <Plug>(coc-refactor)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <silent> <leader>f :call CocActionAsync('format')<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-git
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
nmap <silent> <leader>u :<C-u>CocCommand git.chunkUndo<CR>

" coc-clangd
" toggle source header
nmap <silent> <leader><C-I> :<C-u>CocCommand clangd.switchSourceHeader<CR>

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" }}} coc.nvim

" -> vim-lsp-cxx-highlight  {{{
" vim-lsp-cxx-highlight is a vim plugin that provides C/C++/ObjC semantic highlighting using the language server protocol.
Plug 'jackguo380/vim-lsp-cxx-highlight'



" }}} vim-lsp-cxx-highlight

" -> nvim-gdb  {{{
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

" }}} nvim-gdb

" -> vim-fugitive  {{{
" fugitive.vim: A Git wrapper so awesome, it should be illegal.
Plug 'tpope/vim-fugitive'

" }}} vim-fugitive

" -> vim-rhubarb  {{{
" rhubarb.vim: GitHub extension for fugitive.vim
Plug 'tpope/vim-rhubarb'

" }}} vim-rhubarb

" -> vimtex  {{{
" A modern vim plugin for editing LaTeX files.
Plug 'lervag/vimtex'

let g:tex_flavor = 'latex'

" }}} vimtex

" -> vim-bnfc-syntax  {{{
" Highlighting for BNFC grammars
Plug 'neapel/vim-bnfc-syntax'

" }}} vim-bnfc-syntax

" -> fzf  {{{
" A command-line fuzzy finder.
Plug 'junegunn/fzf'

" }}} fzf

" -> fzf.vim  {{{
" fzf for vim. fzf.vim depends on the basic Vim plugin of the main fzf repository, which means you need to set up both 'fzf' and 'fzf.vim' on Vim.
Plug 'junegunn/fzf.vim'


set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
nnoremap <silent> <leader>e :FZF<CR>

" }}} fzf.vim

" -> vim-which-key  {{{
" Vim plugin that shows keybindings in popup.
Plug 'liuchengxu/vim-which-key'

" }}} vim-which-key

" -> ultisnips  {{{
" The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips'


let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
if getcwd() =~ "nao"
  call add(g:UltiSnipsSnippetDirectories,'/home/schmidma/worktree/hulks/nao/tools/IDEPlugins/NaoSnippets')
endif

" }}} ultisnips

" -> vim-snippets  {{{
" vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'honza/vim-snippets'

" }}} vim-snippets

" -> vim-grammarous  {{{
" vim-grammarous is a powerful grammar checker for Vim. Simply do :GrammarousCheck to see the powerful checking. This plugin automatically downloads LanguageTool, which requires Java 8+.
Plug 'rhysd/vim-grammarous'

" }}} vim-grammarous

" -> base16-vim  {{{
" Base16 for Vim.
Plug 'chriskempson/base16-vim'

" }}} base16-vim

" -> goyo  {{{
"  Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" }}} goyo

" -> tabular  {{{
" Vim script for text filtering and alignment

Plug 'godlygeek/tabular'


" }}} tabular

" -> dart-vim-plugin  {{{
" dart-vim-plugin provides filetype detection, syntax highlighting, and indentation for Dart code in Vim.

Plug 'dart-lang/dart-vim-plugin'

" }}} dart-vim-plugin

" -> vim-doge  {{{
" (Do)cumentation (Ge)nerator 15+ languages books Generate proper code documentation skeletons with a single keypress. zapfire

Plug 'kkoomen/vim-doge'

" }}} vim-doge


" All of your Plugins must be added before the following line
call plug#end()            " required

" }}}}}}}}}}}}}}}}}}}}}}}}}}}}} Plugins


" === Visual Settings ===  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{

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
highlight CocHighlightText cterm=bold ctermfg=4 ctermbg=18 gui=bold guifg=#c2dee8 guibg=#282828


" }}}}}}}}}}}}}}}}}}}}}}}}}}}}} Visual Settings

