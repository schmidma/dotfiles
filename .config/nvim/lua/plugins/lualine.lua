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

local icons = require("icons")

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = base16,
    		component_separators = { left = " ", right = " " },
    		section_separators = { left = " ", right = " " },
    		-- disabled_filetypes = { "neo-tree" },
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
    		lualine_x = {
          "require'lsp-status'.status()",
        },
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
  }
}
