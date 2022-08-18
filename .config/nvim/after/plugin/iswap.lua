local iswap = require("iswap")
-- mappings
local nmap = require("keymap").nmap
local keys = require("keymap").keys
nmap(keys.iswap, iswap.iswap)
