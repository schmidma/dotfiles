local keys = require("keys")

return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{
				keys.trouble.document_diagnostics,
				function()
					vim.cmd.TroubleToggle("document_diagnostics")
				end,
				desc = "Document Diagnostics (Trouble)",
			},
			{
				keys.trouble.workspace_diagnostics,
				function()
					vim.cmd.TroubleToggle("workspace_diagnostics")
				end,
				desc = "Workspace Diagnostics (Trouble)",
			},
			{
				keys.trouble.location_list,
				function()
					vim.cmd.TroubleToggle("loclist")
				end,
				desc = "Location List (Trouble)",
			},
			{
				keys.trouble.quickfix_list,
				function()
					vim.cmd.TroubleToggle("quickfix")
				end,
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
