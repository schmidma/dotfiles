return {
	settings = {
		texlab = {
			build = {
				args = {
					"-e",
					[["$pdf_mode = 1 unless $pdf_mode != 0;"]],
					"-interaction=nonstopmode",
					"-synctex=1",
					"-recorder",
					"%f",
				},
				onSave = true,
				forwardSearchAfter = true,
			},
			forwardSearch = {
				executable = "zathura",
				args = { "--synctex-forward", "%l:1:%f", "%p" },
			},
			chktex = {
				onOpenAndSave = true,
				onEdit = false,
			},
		},
	},
}
