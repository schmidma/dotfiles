local keys = require("keys")

local function get_color(group, attr)
	return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

local function theme_postfix()
	local colors = require("base16-colorscheme").colors
	local highlight = require("base16-colorscheme").highlight

	local bg_gutter = colors.base01

	highlight.LineNr = {
		guibg = bg_gutter,
		guifg = get_color("LineNr", "fg"),
	}
	highlight.SignColumn = {
		guibg = bg_gutter,
		guifg = get_color("SignColumn", "fg"),
	}
	highlight.DiagnosticSignError = {
		guibg = bg_gutter,
		guifg = get_color("DiagnosticError", "fg"),
	}
	highlight.DiagnosticSignWarn = {
		guibg = bg_gutter,
		guifg = get_color("DiagnosticWarn", "fg"),
	}
	highlight.DiagnosticSignHint = {
		guibg = bg_gutter,
		guifg = get_color("DiagnosticHint", "fg"),
	}
	highlight.DiagnosticSignInfo = {
		guibg = bg_gutter,
		guifg = get_color("DiagnosticInfo", "fg"),
	}
	highlight.GitGutterAdd = {
		guibg = bg_gutter,
		guifg = get_color("GitGutterAdd", "fg"),
	}
	highlight.GitGutterChange = {
		guibg = bg_gutter,
		guifg = get_color("GitGutterChange", "fg"),
	}
	highlight.GitGutterDelete = {
		guibg = bg_gutter,
		guifg = get_color("GitGutterDelete", "fg"),
	}
	highlight.GitGutterChangeDelete = {
		guibg = bg_gutter,
		guifg = get_color("GitGutterChangeDelete", "fg"),
	}
end

return {
	{
		"RRethy/nvim-base16",
		opts = {
			theme = "base16-default-dark",
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("Colorscheme", {
				group = vim.api.nvim_create_augroup("colorscheme-postfixes", {}),
				callback = theme_postfix,
			})

			vim.cmd.colorscheme(opts.theme)
		end,
	},
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
}
