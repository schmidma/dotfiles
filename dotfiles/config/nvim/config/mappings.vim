" === Mappings ===

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
