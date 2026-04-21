local function gh(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({
	{ src = gh("rebelot/kanagawa.nvim") },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("nvim-mini/mini.bufremove") },
	{ src = gh("akinsho/bufferline.nvim") },
	{ src = gh("linux-cultist/venv-selector.nvim") },
	{ src = gh("j-hui/fidget.nvim") },
	{ src = gh("nvim-mini/mini.icons") },
	{ src = gh("folke/snacks.nvim") },
	{ src = gh("folke/which-key.nvim") },
	{ src = gh("nvim-mini/mini.ai") },
	{ src = gh("nvim-mini/mini.surround") },
	{ src = gh("nvim-mini/mini.indentscope") },
	{ src = gh("nvim-mini/mini.files") },
	{ src = gh("saghen/blink.cmp"), version = "v1" },
	{ src = gh("zbirenbaum/copilot.lua") },
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("RRethy/vim-illuminate") },
	{ src = gh("lewis6991/gitsigns.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
	{ src = gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },
	{ src = gh("barreiroleo/ltex_extra.nvim"), version = "dev" },
	-- { src = gh("stevearc/quicker.nvim") },
	-- { src = gh("kevinhwang91/nvim-bqf") },
})

require("config.options")
require("config.keymaps")
require("config.mini-icons")
require("config.diagnostics")
require("config.filetype")
require("config.autoformat")
require("config.autocommands")
require("config.lsp")

require("config.kanagawa")
require("config.bufferline")
require("config.lualine")
require("config.mini-bufremove")
require("config.venv-selector")
require("config.fidget")
require("config.snacks")
require("config.which-key")
require("config.treesitter")
require("config.mini-ai")
require("config.mini-surround")
require("config.mini-indentscope")
require("config.mini-files")
require("config.blink-cmp")
require("config.copilot")
require("config.conform")
require("config.illuminate")
require("config.picker")
require("config.gitsigns")
require("config.ltex-extra")
