return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		-- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", },
		opts = {
			ensure_installed = { "vimdoc", "c", "lua", "rust", "vim", "regex", "bash", "markdown_inline" },
			auto_install = true,
			highlight = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.typst = {
				install_info = {
					url = "https://github.com/SeniorMars/tree-sitter-typst",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "main",
				},
				filetype = "typst",
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
	},
	{
		"nvim-treesitter/playground",
		cmd = {
			"TSPlaygroundToggle",
		},
	},
}
