local opts = {
	server = {
		standalone = true,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					features = "all",
				},
				assist = {
					importEnforceGranularity = true,
				},
				checkOnSave = {
					command = "clippy",
				}
			},
		},
	},
}

require("rust-tools").setup(opts)
