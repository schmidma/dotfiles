
source $HOME/.config/nvim/config/basic.vim
source $HOME/.config/nvim/config/functions.vim
source $HOME/.config/nvim/config/abbreviations.vim
source $HOME/.config/nvim/config/autocmd_rules.vim
source $HOME/.config/nvim/config/mappings.vim

" === Plugins ===

call plug#begin()

source $HOME/.config/nvim/config/plugins/nerdtree.vim
source $HOME/.config/nvim/config/plugins/vim-airline.vim
source $HOME/.config/nvim/config/plugins/vim-airline-themes.vim
source $HOME/.config/nvim/config/plugins/tagbar.vim
source $HOME/.config/nvim/config/plugins/clever-f.vim
source $HOME/.config/nvim/config/plugins/vim-closer.vim
source $HOME/.config/nvim/config/plugins/vim-sourround.vim
source $HOME/.config/nvim/config/plugins/coc.nvim.vim
source $HOME/.config/nvim/config/plugins/nvim-gdb.vim
source $HOME/.config/nvim/config/plugins/vim-fugitive.vim
source $HOME/.config/nvim/config/plugins/vim-rhubarb.vim
source $HOME/.config/nvim/config/plugins/vimtex.vim
source $HOME/.config/nvim/config/plugins/vim-snippets.vim
source $HOME/.config/nvim/config/plugins/base16-vim.vim
source $HOME/.config/nvim/config/plugins/goyo.vim
source $HOME/.config/nvim/config/plugins/tabular.vim
source $HOME/.config/nvim/config/plugins/vim-lsp-cxx-highlight.vim
source $HOME/.config/nvim/config/plugins/nvim-treesitter.vim
source $HOME/.config/nvim/config/plugins/iswap.vim
source $HOME/.config/nvim/config/plugins/telescope.nvim.vim

Plug 'nvim-treesitter/playground'

" All of your Plugins must be added before the following line
call plug#end()            " required

source $HOME/.config/nvim/config/visual.vim
source $HOME/.config/nvim/config/treesitter.vim
source $HOME/.config/nvim/config/telescope.nvim.vim
