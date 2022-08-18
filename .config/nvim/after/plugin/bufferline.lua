local bufferline = require("bufferline")

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "slant",
	},
})

-- mappings
local nmap = require("keymap").nmap
local keys = require("keymap").keys

nmap(keys.buffer.prev, function()
	bufferline.cycle(-1)
end)
nmap(keys.buffer.next, function()
	bufferline.cycle(1)
end)
nmap(keys.buffer.pick, "<cmd>BufferLinePick<CR>")
