local keys = require("keys")

return {
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)

			vim.keymap.set("n", keys.lsp.next_reference, function()
				require("illuminate")["goto_next_reference"](false)
			end, { desc = "Next Reference" })
			vim.keymap.set("n", keys.lsp.prev_reference, function()
				require("illuminate")["goto_prev_reference"](false)
			end, { desc = "Previous Reference" })
		end,
		keys = {
			{ keys.lsp.next_reference, desc = "Next Reference" },
			{ keys.lsp.prev_reference, desc = "Prev Reference" },
		},
	},
}
