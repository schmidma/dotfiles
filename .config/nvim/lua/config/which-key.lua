local wk = require("which-key")
local keys = require("config.keys")

wk.setup({
	preset = "modern",
})

wk.add({
	{ "<leader>b", group = "Buffer", icon = { icon = "󰓩", color = "azure" } },
	{ "<leader>c", group = "Code", icon = { icon = "󰘦", color = "orange" } },
	{ "<leader>d", group = "Diagnostics", icon = { icon = "󰒡", color = "yellow" } },
	{ "<leader>f", group = "Find", icon = { icon = "󰍉", color = "blue" } },
	{ "<leader>g", group = "Git", icon = { icon = "󰊢", color = "orange" } },
	{ "<leader>gh", group = "Hunk", icon = { icon = "󰊢", color = "orange" } },
	{ "<leader>u", group = "UI", icon = { icon = "󰙵", color = "purple" } },
	{ "<leader>v", group = "Venv", icon = { icon = "󰌠", color = "green" } },
	{ keys.clipboard.yank, icon = { icon = "󰆏", color = "green" } },
	{ keys.clipboard.yank_line, icon = { icon = "󰆏", color = "green" } },
	{ keys.clipboard.paste, icon = { icon = "󰆒", color = "blue" } },
	{ keys.clipboard.paste_before, icon = { icon = "󰆒", color = "blue" } },
	{ keys.files.current, icon = { icon = "󰉋", color = "azure" } },
	{ keys.files.cwd, icon = { icon = "󰉖", color = "azure" } },
	{ keys.venv.select, icon = { icon = "󰌠", color = "green" } },
})
