vim.filetype.add({
	pattern = {
		-- Add a special filetype extension to indicate a GitHub Actions
		-- workflow. This is used to run GitHub Actions linters.
		[".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
	},
})
