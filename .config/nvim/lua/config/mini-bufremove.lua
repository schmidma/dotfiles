local keys = require("config.keys")
local map = keys.map

map("n", keys.buffer.delete, function()
	require("mini.bufremove").delete(0, false)
end, { desc = "Delete buffer" })
map("n", keys.buffer.force_delete, function()
	require("mini.bufremove").delete(0, true)
end, { desc = "Delete buffer (force)" })
