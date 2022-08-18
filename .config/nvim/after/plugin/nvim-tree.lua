local nmap = require("keymap").nmap
local keys = require("keymap").keys

nmap(keys.toggle_file_tree, require("nvim-tree").toggle)
