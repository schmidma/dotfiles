local gitsigns = require("gitsigns")
gitsigns.setup({
	signs = {
		add = {
			hl = "GitGutterAdd",
			text = "+",
		},
		change = {
			hl = "GitGutterChange",
			text = "~",
		},
		delete = {
			hl = "GitGutterDelete",
			text = "_",
		},
		topdelete = {
			hl = "GitGutterDelete",
			text = "‾",
		},
		changedelete = {
			hl = "GitGutterChange",
			text = "~",
		},
	},
})

-- mappings
local nmap = require("keymap").nmap
nmap("<leader>hr", gitsigns.reset_hunk)
nmap("<leader>hp", gitsigns.preview_hunk)
nmap("<leader>bl", gitsigns.blame_line)
