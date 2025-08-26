local keys = require("config.keys")

return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{
				keys.trouble.diagnostics,
				function()
					vim.cmd.Trouble("diagnostics toggle")
				end,
				desc = "Diagnostics (Trouble)",
			},
			{
				keys.trouble.buffer_diagnostics,
				function()
					vim.cmd.Trouble("diagnostics toggle filter.buf=0")
				end,
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				keys.trouble.symbols,
				function()
					vim.cmd.Trouble("symbols toggle focus=false")
				end,
				desc = "Symbols (Trouble)",
			},
			{
				keys.trouble.lsp,
				function()
					vim.cmd.Trouble("lsp toggle focus=false win.position=right")
				end,
				desc = "LSP Definitions / References / ... (Trouble)",
			},
			{
				keys.trouble.location,
				function()
					vim.cmd.Trouble("loclist toggle")
				end,
				desc = "Location List (Trouble)",
			},
			{
				keys.trouble.quickfix,
				function()
					vim.cmd.Trouble("qflist toggle")
				end,
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
