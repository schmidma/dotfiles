require("blink.cmp").setup({
	keymap = { preset = "default" },
	completion = {
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
		menu = {
			border = "none",
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
			window = {},
		},
		ghost_text = { enabled = true },
	},
	signature = {
		enabled = true,
		window = {},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})
