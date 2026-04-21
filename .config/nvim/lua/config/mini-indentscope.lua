require("mini.indentscope").setup({
	draw = {
		delay = 50,
		animation = require("mini.indentscope").gen_animation.linear({
			duration = 10,
		}),
	},
	options = { try_as_border = true },
	symbol = "┊",
})
