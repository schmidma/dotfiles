local keys = require("config.keys")
local flash = require("flash")

flash.setup({})

keys.map({ "n", "x", "o" }, keys.flash.jump, function()
	flash.jump()
end, { desc = "Flash jump" })
