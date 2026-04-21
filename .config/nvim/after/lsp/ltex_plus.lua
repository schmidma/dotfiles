return {
	filetypes = { "tex", "plaintex", "bib", "markdown" },
	settings = {
		ltex = {
			language = "en-US",
			enabled = { "latex", "tex", "plaintex", "bib", "markdown" },
			completionEnabled = false,
			additionalRules = {
				enablePickyRules = true,
			},
		},
	},
}
