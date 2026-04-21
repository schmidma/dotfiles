require("kanagawa").setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	dimInactive = true,
	overrides = function(colors)
		local theme = colors.theme
		return {
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
			-- NormalFloat = { bg = "none" },
			-- FloatBorder = { bg = "none" },
			-- FloatTitle = { bg = "none" },
			-- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
		}
	end,
})

vim.cmd.colorscheme("kanagawa")
