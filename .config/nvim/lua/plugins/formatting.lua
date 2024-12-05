local keys = require("keys")

local function toggle_autoformat()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	if vim.g.disable_autoformat then
		vim.notify("Disabled format on save", vim.log.levels.INFO, { title = "Format" })
	else
		vim.notify("Enabled format on save", vim.log.levels.INFO, { title = "Format" })
	end
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			keys.lsp.format,
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	init = function()
		vim.api.nvim_create_user_command("ToggleAutoformat", toggle_autoformat, {})
	end,
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			json = { "prettierd" },
			markdown = { "prettierd" },
			typst = { "typstyle" },
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_fallback = true }
		end,
	},
}
