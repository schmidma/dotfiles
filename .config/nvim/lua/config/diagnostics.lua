local icons = require("config.icons")
local severity = vim.diagnostic.severity

vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	virtual_text = {
		prefix = "●",
		-- spacing = 2,
		source = "if_many",
	},
	float = {
		source = "if_many",
	},
	signs = {
		text = {
			[severity.ERROR] = icons.diagnostics.Error,
			[severity.WARN] = icons.diagnostics.Warn,
			[severity.INFO] = icons.diagnostics.Info,
			[severity.HINT] = icons.diagnostics.Hint,
		},
	},
})
