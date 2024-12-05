local keys = require("keys")

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
	{
		"rebelot/kanagawa.nvim",
		config = function()
			local kanagawa = require("kanagawa")
			kanagawa.setup({
				dimInactive = true,
				overrides = function(colors)
					local theme = colors.theme
					return {
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
			})
			kanagawa.load()
		end,
	},
}
