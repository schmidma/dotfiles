local keys = require("config.keys")

local group = vim.api.nvim_create_augroup("config_copilot_blink", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	group = group,
	callback = function()
		require("copilot.suggestion").dismiss()
		vim.b.copilot_suggestion_hidden = true
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	group = group,
	callback = function()
		vim.b.copilot_suggestion_hidden = false
	end,
})

keys.map("i", keys.completion.copilot_next, function()
	require("blink.cmp").hide()
	require("copilot.suggestion").next()
end, { desc = "Next Copilot suggestion" })

keys.map("i", keys.completion.copilot_prev, function()
	require("blink.cmp").hide()
	require("copilot.suggestion").prev()
end, { desc = "Previous Copilot suggestion" })

require("copilot").setup({
	panel = { enabled = false },
	suggestion = {
		auto_trigger = false,
		trigger_on_accept = false,
		keymap = {
			next = false,
			prev = false,
			accept = keys.completion.copilot_accept,
		},
	},
})
