local keys = require("keys")

return {
	{
		"mizlan/iswap.nvim",
		cmd = { "ISwap" },
		opts = {},
		keys = {
			{
				keys.iswap,
				function()
					vim.cmd.ISwap()
				end,
				desc = "ISwap",
			},
		},
	},
}
