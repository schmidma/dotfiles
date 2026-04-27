local snacks = require("snacks")
local keys = require("config.keys")
local autoformat = require("config.autoformat")

snacks.setup({
	notifier = {
		enabled = true,
	},

	picker = {
		enabled = true,
		sources = {
			files = {
				hidden = true,
			},
			select = {
				kinds = {
					codeaction = {
						layout = {
							preset = "select",
							layout = {
								relative = "cursor",
								row = 1,
								col = 0,
							},
						},
					},
				},
			},
		},
	},

	toggle = {
		enabled = true,
		-- map = keys.map,
		notify = false,
	},
	input = {
		enabled = true,
		icon_pos = "title",
		win = {
			wo = {
				winhighlight = table.concat({
					"NormalFloat:SnacksInputNormal",
					"FloatBorder:SnacksInputBorder",
					"FloatTitle:SnacksInputTitle",
					"LineNr:SnacksInputNormal",
				}, ","),
			},
		},
	},
	styles = {
		input = {
			relative = "cursor",
			row = -3,
			col = 0,
			width = 30,
			title_pos = "left",
		},
	},
})

snacks.toggle.diagnostics({ name = "Diagnostics" }):map(keys.ui.diagnostics)
snacks.toggle.option("list", { name = "Whitespace" }):map(keys.ui.whitespace)
snacks.toggle.inlay_hints({ name = "Inlay Hints" }):map(keys.ui.inlay_hints)
snacks.toggle.option("wrap", { name = "Wrap" }):map(keys.ui.wrap)
snacks.toggle.option("spell", { name = "Spell" }):map(keys.ui.spell)
snacks.toggle.option("number", { name = "Line Numbers" }):map(keys.ui.line_numbers)
snacks.toggle.option("relativenumber", { name = "Relative Numbers" }):map(keys.ui.relative_numbers)
snacks
	.toggle({
		id = "autoformat_buffer",
		name = "Auto Format Buffer",
		get = function()
			return autoformat.is_enabled(0)
		end,
		set = function(state)
			autoformat.set_enabled(state, 0)
		end,
	})
	:map(keys.ui.autoformat_buffer)
snacks
	.toggle({
		id = "autoformat_global",
		name = "Auto Format Global",
		get = autoformat.is_enabled,
		set = function(state)
			autoformat.set_enabled(state)
		end,
	})
	:map(keys.ui.autoformat_global)
