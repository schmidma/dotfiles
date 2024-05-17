return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local opts = { window = { border = "rounded" } }

			local wk = require("which-key")
			wk.setup(opts)
			wk.register({
				["<leader>h"] = { "Git Hunks" },
				["<leader>g"] = { "Git" },
			})
		end,
	},
}
