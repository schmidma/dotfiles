local options = {
	["lua_ls"] = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	["texlab"] = {
		settings = {
			texlab = {
				auxDirectory = "output",
				chktex = {
					onEdit = true,
					onOpenAndSave = true,
				},
			},
		},
	},
	["ruff"] = {
		on_attach = function(client, bufnr)
			client.server_capabilities.hoverProvider = false
		end,
	},
	["pyright"] = {
		settings = {
			python = {
				analysis = {
					stubPath = "~/typings",
				},
			},
		},
	},
	["julials"] = {
		settings = {
			julia = {
				lint = {
					call = false,
				},
			},
		},
	},
	["typst_lsp"] = {
		settings = {
			exportPdf = "never",
		},
	},
}

return options
