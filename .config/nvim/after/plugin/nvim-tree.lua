require("nvim-tree").setup({ view = { side = "right" }, diagnostics = { enable = true } })

local nmap = require("keymap").nmap
local keys = require("keymap").keys

nmap(keys.toggle_file_tree, require("nvim-tree").toggle)
