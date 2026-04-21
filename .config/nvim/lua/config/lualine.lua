local icons = require("config.icons")

local function copilot_status()
	if #vim.lsp.get_clients({ bufnr = 0, name = "copilot" }) > 0 then
		return " "
	end

	return ""
end

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "minifiles" },
		},
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
		lualine_x = { "venv-selector" },
		lualine_y = {
			{
				"filetype",
				colored = true,
				icon_only = false,
			},
			{ "progress", separator = "|" },
			{ "location", padding = { left = 0, right = 1 } },
		},
		lualine_z = {
			{
				"lsp_status",
				icon = "󰒋",
				ignore_lsp = { "copilot" },
				show_name = true,
				symbols = {
					spinner = "",
					done = "",
					separator = " ",
				},
			},
			{ copilot_status },
		},
	},
})

vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
	group = vim.api.nvim_create_augroup("nvim_next_lualine_lsp_refresh", { clear = true }),
	callback = function()
		require("lualine").refresh()
	end,
})
