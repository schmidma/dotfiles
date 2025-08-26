local keys = require("config.keys")

return {
	{
		"chrishrb/gx.nvim",
		keys = { { keys.open_url, "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		submodules = false,
		init = function()
			vim.g.netrw_nogx = 1
		end,
		config = {
			handlers = {
				rust = {
					name = "rust",
					filename = "Cargo.toml",
					handle = function(mode, line, _)
						local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")

						if crate then
							return "https://crates.io/crates/" .. crate
						end
					end,
				},
			},
		},
	},
}
