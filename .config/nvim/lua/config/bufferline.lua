local icons = require("config.icons")
local keys = require("config.keys")
local map = keys.map

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		diagnostics_indicator = function(_, _, diagnostics)
			local parts = {}
			local diagnostic_icons = {
				error = icons.diagnostics.Error,
				warning = icons.diagnostics.Warn,
				info = icons.diagnostics.Info,
				hint = icons.diagnostics.Hint,
			}

			for severity, count in pairs(diagnostics) do
				local icon = diagnostic_icons[severity]
				if icon then
					table.insert(parts, icon .. count)
				end
			end

			return table.concat(parts, " ")
		end,
	},
})

map("n", keys.buffer.prev, "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", keys.buffer.next, "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", keys.buffer.pick, "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
