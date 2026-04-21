vim.filetype.add({
	pattern = {
		[".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
	},
})
