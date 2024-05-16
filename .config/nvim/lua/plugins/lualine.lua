local function derive_base16_theme()
	local base16 = require("base16-colorscheme")
	local colors = {
		black = base16.colors.base00,
		white = base16.colors.base05,
		red = base16.colors.base08,
		green = base16.colors.base0B,
		blue = base16.colors.base0D,
		yellow = base16.colors.base0A,
		gray = base16.colors.base02,
		darkgray = base16.colors.base01,
		lightgray = base16.colors.base06,
	}

	return {
		normal = {
			a = { bg = colors.red, fg = colors.black, gui = "bold" },
			b = { bg = colors.gray, fg = colors.green },
			c = { bg = colors.darkgray, fg = colors.white },
		},
		insert = {
			a = { bg = colors.green, fg = colors.black, gui = "bold" },
			b = { bg = colors.gray, fg = colors.green },
			c = { bg = colors.darkgray, fg = colors.white },
		},
		visual = {
			a = { bg = colors.blue, fg = colors.black, gui = "bold" },
			b = { bg = colors.gray, fg = colors.green },
			c = { bg = colors.darkgray, fg = colors.white },
		},
		replace = {
			a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
			b = { bg = colors.gray, fg = colors.green },
			c = { bg = colors.darkgray, fg = colors.white },
		},
		command = {
			a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
			b = { bg = colors.gray, fg = colors.green },
			c = { bg = colors.darkgray, fg = colors.white },
		},
		inactive = {
			a = { bg = colors.gray, fg = colors.black, gui = "bold" },
			b = { bg = colors.gray, fg = colors.green },
			c = { bg = colors.darkgray, fg = colors.white },
		},
	}
end

local icons = require("icons")

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "RRethy/nvim-base16" },
		opts = function()
			return {
				options = {
					theme = derive_base16_theme,
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
