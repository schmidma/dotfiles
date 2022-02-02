local packer = require('packer')
packer.init {
  display = {open_fn = require('packer.util').float},
  profile = {enable = true}
}
packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind-nvim'
  use 'williamboman/nvim-lsp-installer'
  use {
    'simrat39/rust-tools.nvim',
    config = function() require('plugins/rust-tools') end
  }

  -- dap
  use 'mfussenegger/nvim-dap'
  use {
    'rcarriga/nvim-dap-ui',
    requires = 'mfussenegger/nvim-dap',
    config = function() require('dapui').setup() end,
  }
  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = 'mfussenegger/nvim-dap',
    config = function() require('nvim-dap-virtual-text').setup() end,
  }
  use {
    'nvim-telescope/telescope-dap.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('dap') end,
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins/nvim-treesitter') end,
    requires = 'nvim-treesitter/nvim-treesitter-textobjects'
  }
  use 'nvim-treesitter/playground'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins/nvim-cmp') end,
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp', 
      'saadparwaiz1/cmp_luasnip', 
      'tamago324/cmp-zsh'
    }
  }

  -- snippets
  use {
    'L3MON4D3/LuaSnip',
    config = function() require('plugins/luasnip') end,
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    config = function() require('plugins/nvim-telescope') end
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    config = function() require('telescope').load_extension('fzf') end
  }
  use {
    'cwebster2/github-coauthors.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('githubcoauthors') end,
  }

  -- colorscheme
  use 'RRethy/nvim-base16'

  -- surround
  use {
    "blackCauldron7/surround.nvim",
    config = function() require"surround".setup {} end
  }
  -- Comment.nvim
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- lualine.nvim
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('plugins/lualine') end,
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- A snazzy bufferline for Neovim
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins/nvim-bufferline') end
  }

  -- A Neovim plugin to improve buffer deletion
  use 'ojroques/nvim-bufdel'

  -- autopairs for neovim
  use {
    'windwp/nvim-autopairs',
    config = function() require('plugins/nvim-autopairs') end,
    requires = 'hrsh7th/nvim-cmp',
    before = 'nvim-cmp'
  }

  -- interactively swap elements. Powered by treesitter
  use {'mizlan/iswap.nvim', cmd = {"ISwap", "ISwapWith"}}

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('plugins/gitsigns-nvim') end
  }
  use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
  use {
    'f-person/git-blame.nvim',
    config = function() vim.g.gitblame_enabled = 0 end
  }

end)
