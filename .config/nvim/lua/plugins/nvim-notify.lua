local icons = require("icons")
local keys = require("keys")

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
      { keys.dismiss_notifications, function() require("notify").dismiss() end, desc = "Dismiss Notifications" }
    }
  }
  -- {
  -- 	"folke/noice.nvim",
  -- 	dependencies = {
  -- 		"rcarriga/nvim-notify",
  -- 	},
  -- 	opts = {
  -- 		lsp = {
  -- 			override = {
  -- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  -- 				["vim.lsp.util.stylize_markdown"] = true,
  -- 				["cmp.entry.get_documentation"] = true,
  -- 			},
  -- 		},
  -- 		presets = {
  -- 			bottom_search = true,
  -- 			command_palette = false,
  -- 			long_message_to_split = true,
  -- 			lsp_doc_border = true,
  -- 		},
  -- 	},
  -- },
}
