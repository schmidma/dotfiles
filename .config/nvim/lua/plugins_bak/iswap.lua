local keys = require("keys")

return {
	{
		"mizlan/iswap.nvim",
		cmd = { "ISwap" },
		opts = {
			autoswap = true,
		},
		keys = {
			{
				keys.iswap,
				vim.cmd.ISwap,
				desc = "ISwap",
			},
		},
	},
}
