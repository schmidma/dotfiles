local keys = require("config.keys")

return {
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			require("illuminate").configure({})
		end,
		keys = {
			{
				keys.lsp.next_reference,
				function()
					require("illuminate")["goto_next_reference"](false)
				end,
				desc = "Next Reference",
			},
			{
				keys.lsp.prev_reference,
				function()
					require("illuminate")["goto_prev_reference"](false)
				end,
				desc = "Previous Reference",
			},
		},
	},
}
