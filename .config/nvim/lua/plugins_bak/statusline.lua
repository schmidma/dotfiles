local icons = require("icons")

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "RRethy/nvim-base16" },
		opts = function()
			return {
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "neo-tree" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
						"diagnostics",
					},
					lualine_c = {
						{
							"filename",
							path = 1,
							symbols = { modified = " ", readonly = " " },
						},
					},
					lualine_x = {},
					lualine_y = {
						"filetype",
						{ "progress", separator = "|" },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{
							"filename",
							path = 1,
							symbols = { modified = " ", readonly = " " },
						},
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "neo-tree" },
			}
		end,
		config = true,
	},
}
