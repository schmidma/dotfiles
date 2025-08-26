local keys = require("config.keys")

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			local suggestion = require("copilot.suggestion")

			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpMenuOpen",
				callback = function()
					require("copilot.suggestion").dismiss()
					vim.b.copilot_suggestion_hidden = true
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpMenuClose",
				callback = function()
					vim.b.copilot_suggestion_hidden = false
				end,
			})

			vim.keymap.set("i", keys.completion.copilot.next, function()
				require("blink.cmp").hide()
				suggestion.next()
			end)
			vim.keymap.set("i", keys.completion.copilot.previous, function()
				require("blink.cmp").hide()
				suggestion.prev()
			end)

			require("copilot").setup({
				suggestion = {
					keymap = {
						next = false,
						prev = false,
						accept = keys.completion.confirm,
					},
				},
				panel = { enabled = false },
			})
		end,
	},
}
