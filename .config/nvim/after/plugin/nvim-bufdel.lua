local nmap = require("keymap").nmap
local keys = require("keymap").keys

nmap(keys.buffer.close, "<cmd>BufDel<CR>")
