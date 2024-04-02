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
			},
			{
				keys.conflict.previous,
				"<Plug>(git-conflict-prev-conflict)",
			},
			{
				keys.conflict.choose_ours,
				"<Plug>(git-conflict-ours)",
			},
			{
				keys.conflict.choose_theirs,
				"<Plug>(git-conflict-theirs)",
			},
			{
				keys.conflict.choose_both,
				"<Plug>(git-conflict-both)",
			},
			{
				keys.conflict.choose_none,
				"<Plug>(git-conflict-none)",
			},
		},
	},
}
