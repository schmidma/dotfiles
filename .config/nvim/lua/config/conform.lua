local autoformat = require("config.autoformat")
local keys = require("config.keys")

require("conform").setup({
	formatters_by_ft = {
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		rust = { "rustfmt" },
		scss = { "prettier" },
		toml = { "taplo" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		yaml = { "prettier" },
	},
	format_on_save = function(bufnr)
		if not autoformat.is_enabled(bufnr) then
			return
		end

		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

keys.map({ "n", "v" }, keys.lsp.format, function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
