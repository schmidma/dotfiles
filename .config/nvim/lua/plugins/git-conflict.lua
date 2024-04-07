local keys = require("keys")

return {
	{
		"akinsho/git-conflict.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			default_mappings = false,
		},
		keys = {
			{
				keys.conflict.next,
				"<Plug>(git-conflict-next-conflict)",
				desc = "Next conflict",
			},
			{
				keys.conflict.previous,
				"<Plug>(git-conflict-prev-conflict)",
				desc = "Previous conflict",
			},
			{
				keys.conflict.choose_ours,
				"<Plug>(git-conflict-ours)",
				desc = "Choose ours",
			},
			{
				keys.conflict.choose_theirs,
				"<Plug>(git-conflict-theirs)",
				desc = "Choose theirs",
			},
			{
				keys.conflict.choose_both,
				"<Plug>(git-conflict-both)",
				desc = "Choose both",
			},
			{
				keys.conflict.choose_none,
				"<Plug>(git-conflict-none)",
				desc = "Choose none",
			},
		},
	},
}
