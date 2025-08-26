local icons = require("config.icons")
local keys = require("config.keys")

return {
	{
		"rcarriga/nvim-notify",
		init = function()
			vim.notify = require("notify")
		end,
		opts = {
			icons = {
				DEBUG = icons.diagnostics.Debug,
				ERROR = icons.diagnostics.Error,
				INFO = icons.diagnostics.Info,
				TRACE = icons.diagnostics.Trace,
				WARN = icons.diagnostics.Warn,
			},
			timeout = 5000,
			stages = "static",
			render = "compact",
		},
		keys = {
			{
				keys.dismiss_notifications,
				function()
					require("notify").dismiss()
				end,
				desc = "Dismiss Notifications",
			},
		},
	},
}
