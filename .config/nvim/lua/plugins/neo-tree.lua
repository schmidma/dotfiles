local keys = require("keys")

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
			"3rd/image.nvim",
		},
		keys = {
			{
				keys.toggle_file_tree,
				function()
					vim.cmd.Neotree("toggle")
				end,
				"NeoTree",
				desc = "Toggle file tree",
			},
		},
		opts = {
			window = {
				width = 30,
			},
		},
	},
}
