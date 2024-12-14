local keys = require("keys")

return {
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		keys = {
			{
				keys.quickfix.open,
				function()
					require("quicker").toggle({ focus = true })
				end,
				desc = "Open Quickfix Window",
			},
		},
		opts = {},
	},
	{
		"kevinhwang91/nvim-bqf",
		opts = {
			preview = {
				auto_preview = false,
			},
		},
	},
}
