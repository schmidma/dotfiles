local keys = require("config.keys")

return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			name = { "venv", ".venv" },
		},
	},
	{
		"linux-cultist/venv-selector.nvim",
		branch = "regexp",
		lazy = false,
		config = true,
		keys = {
			{ keys.select_venv, vim.cmd.VenvSelect },
		},
	},
}
