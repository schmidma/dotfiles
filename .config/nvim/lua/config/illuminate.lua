local keys = require("config.keys")

require("illuminate").configure()

keys.map("n", keys.lsp.next_reference, function()
	require("illuminate").goto_next_reference(false)
end, { desc = "Go to next reference" })
keys.map("n", keys.lsp.prev_reference, function()
	require("illuminate").goto_prev_reference(false)
end, { desc = "Go to previous reference" })
