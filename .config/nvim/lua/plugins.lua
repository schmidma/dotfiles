-- Auto install packer.nivm if not exist
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

if not is_installed then
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

local packer = require("packer")
packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- LSP
	use("nvim-lua/lsp-status.nvim")
	use("onsails/lspkind-nvim")
	use({
		"simrat39/rust-tools.nvim",
		requires = "neovim/nvim-lspconfig",
	})
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("mason-lspconfig").setup()
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = "nvim-treesitter/nvim-treesitter-textobjects",
	})
	use("nvim-treesitter/playground")

	-- automatically parse indentation style
	use({
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup()
		end,
	})

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	-- snippets
	use("L3MON4D3/LuaSnip")
	-- vscode-style snippets
	use("rafamadriz/friendly-snippets")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})
	use({
		"cwebster2/github-coauthors.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})
	use({
		"nvim-telescope/telescope-ui-select.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})

	-- colorscheme
	use("RRethy/nvim-base16")

	-- notifications
	use({
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				timeout = 1000,
				stages = "static",
			})
			vim.notify = notify
		end,
	})

	-- surround
	use("machakann/vim-sandwich")

	-- Comment.nvim
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- indent-blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({ char = "┊" })
		end,
	})

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- lualine.nvim
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- A snazzy bufferline for Neovim
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- A Neovim plugin to improve buffer deletion
	use("ojroques/nvim-bufdel")

	-- autopairs for neovim
	use({
		"windwp/nvim-autopairs",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("nvim-autopairs").setup({})
		end,
		before = "nvim-cmp",
	})

	-- interactively swap elements. Powered by treesitter
	use("mizlan/iswap.nvim")

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
end)
