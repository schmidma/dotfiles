local keys = require("config.keys")

local function setup_diagnostic_signs()
	for name, icon in pairs(require("config.icons").diagnostics) do
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
	local icons = require("config.icons")
	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
		},
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
				[vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
				[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
				[vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
			},
		},
	})
end

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"https://github.com/neovim/nvim-lspconfig",
		config = function()
			setup_diagnostic_signs()

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					vim.keymap.set(
						{ "n", "v" },
						keys.lsp.code_action,
						vim.lsp.buf.code_action,
						{ buffer = args.buf, desc = "Code action" }
					)
					vim.keymap.set(
						"n",
						keys.lsp.rename,
						vim.lsp.buf.rename,
						{ buffer = args.buf, desc = "Rename symbol" }
					)
					vim.keymap.set("n", keys.lsp.goto_definition, function()
						vim.cmd.Telescope("lsp_definitions")
					end, { buffer = args.buf, desc = "Go to definition" })
					vim.keymap.set("n", keys.lsp.goto_references, function()
						vim.cmd.Telescope("lsp_references")
					end, { buffer = args.buf, desc = "Go to references" })
					vim.keymap.set(
						"n",
						keys.lsp.goto_declaration,
						vim.lsp.buf.declaration,
						{ buffer = args.buf, desc = "Go to declaration" }
					)
					vim.keymap.set("n", keys.lsp.goto_implementations, function()
						vim.cmd.Telescope("lsp_implementations")
					end, { buffer = args.buf, desc = "Go to implementations" })
					vim.keymap.set("n", keys.lsp.goto_type, function()
						vim.cmd.Telescope("lsp_type_definitions")
					end, { buffer = args.buf, desc = "Go to type definition" })
				end,
			})

			vim.diagnostic.config({
				float = {
					source = true,
				},
			})

			vim.lsp.config.ltex = {
				filetypes = {
					"bib",
					"gitcommit",
					"markdown",
					"org",
					"plaintex",
					"rst",
					"rnoweb",
					"tex",
					"pandoc",
					"quarto",
					"rmd",
					"context",
					"text",
				},
			}
			vim.lsp.config.texlab = {
				settings = {
					texlab = {
						build = {
							onSave = true,
							forwardSearchAfter = true,
							args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
						},
						forwardSearch = {
							executable = "zathura",
							args = { "--synctex-forward", "%l:1:%f", "%p" },
						},
						chktex = {
							onEdit = true,
							onOpenAndSave = true,
						},
					},
				},
			}
			vim.lsp.config.harper_ls = {
				filetypes = {
					"gitcommit",
					"html",
					"markdown",
					"typst",
					"tex",
				},
			}

			vim.lsp.enable({
				"lua_ls",
				"basedpyright",
				"ruff",
				"tinymist",
				"ltex",
				"texlab",
				"typos_lsp",
				"harper_ls",
				"ts_ls",
			})
		end,
	},
	{
		"barreiroleo/ltex_extra.nvim",
		branch = "dev",
		ft = { "markdown", "tex" },
		opts = {},
	},
}
