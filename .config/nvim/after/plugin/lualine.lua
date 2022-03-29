local colors = {
	black = "#181818",
	white = "#d8d8d8",
	red = "#ab4642",
	green = "#a1b56c",
	blue = "#7cafc2",
	yellow = "#f7ca88",
	gray = "#383838",
	darkgray = "#282828",
	lightgray = "#e8e8e8",
	inactivegray = "#7c6f64",
}

local base16 = {
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

local function placeholder()
	return [[   ]]
end

require("lualine").setup({
	options = {
		theme = base16,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = " " },
		disabled_filetypes = { "NvimTree" },
	},
	extensions = {},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				symbols = {
					added = " ",
					modified = "柳",
					removed = " ",
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
		lualine_x = { "require'lsp-status'.status()" },
		lualine_y = { "filetype" },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = { placeholder },
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
})
