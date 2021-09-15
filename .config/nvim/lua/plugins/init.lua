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
  use 'kabouzeid/nvim-lspinstall'
  use {
    'RishabhRD/nvim-lsputils',
    requires = 'RishabhRD/popfix',
    config = function() require('plugins/nvim-lsputils') end
  }
  use {
    'simrat39/rust-tools.nvim',
    config = function() require('plugins/rust-tools') end
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins/nvim-treesitter') end,
    requires = 'nvim-treesitter/nvim-treesitter-textobjects'
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-compe',
    config = function() require('plugins/nvim-compe') end,
    event = 'InsertEnter *'
  }
  use {
    'hrsh7th/vim-vsnip',
    config = function() require('plugins/vsnip') end,
    event = 'InsertEnter *'
  }
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'

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

  -- colorscheme
  use 'RRethy/nvim-base16'
  use 'folke/tokyonight.nvim'

  -- surround
  use {
    "blackCauldron7/surround.nvim",
    config = function() require"surround".setup {} end
  }
  -- kommentary
  use {
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true
      })
    end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- galaxyline
  use {
    'glepnir/galaxyline.nvim',
    config = function() require('plugins/galaxyline') end
  }

  -- nvim-tree
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

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
    requires = 'hrsh7th/nvim-compe',
    after = 'nvim-compe'
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

end)
