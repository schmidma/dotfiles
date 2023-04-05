local keys = require("keys")

return {
	{
		"akinsho/git-conflict.nvim",
		opts = {
			default_mappings = {
				next = keys.conflict.next,
				prev = keys.conflict.previous,
			},
		},
	},
}
