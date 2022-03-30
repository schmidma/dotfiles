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

nmap("<leader>j", function()
	bufferline.cycle(-1)
end)
nmap("<leader>k", function()
	bufferline.cycle(1)
end)
nmap("<leader>J", function()
	bufferline.move(-1)
end)
nmap("<leader>K", function()
	bufferline.move(1)
end)
nmap("<C-s>", "<cmd>BufferLinePick<CR>")
