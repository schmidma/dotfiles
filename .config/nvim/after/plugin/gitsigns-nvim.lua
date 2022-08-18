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
local keys = require("keymap").keys

nmap(keys.git.reset_hunk, gitsigns.reset_hunk)
nmap(keys.git.preview_hunk, gitsigns.preview_hunk)
nmap(keys.git.blame_line, gitsigns.blame_line)
