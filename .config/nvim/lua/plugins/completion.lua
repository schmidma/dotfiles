return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			keymap = {
				["<C-n>"] = {
					"select_next",
					function(cmp)
						cmp.show({ initial_selected_item_idx = 1 })
					end,
					"fallback_to_mappings",
				},
				["<C-y>"] = { "select_and_accept", "fallback_to_mappings" },
			},
			appearance = { nerd_font_variant = "mono" },
			signature = { enabled = true },
			completion = {
				-- menu = {
				-- 	draw = {
				-- 		columns = {
				-- 			{ "label", "label_description", gap = 1 },
				-- 			{ "kind_icon", "kind" },
				-- 		},
				-- 	},
				-- },
				documentation = { auto_show = true },
				list = { selection = { preselect = false, auto_insert = false } },
				ghost_text = { enabled = true },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
}
