local keys = require("config.keys")

require("mini.surround").setup({
	mappings = {
		add = keys.surround.add,
		delete = keys.surround.delete,
		find = keys.surround.find,
		find_left = keys.surround.find_left,
		highlight = keys.surround.highlight,
		replace = keys.surround.replace,
	},
})
