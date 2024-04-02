local keys = require("keys")

return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"petertriho/cmp-git",
			"hrsh7th/cmp-cmdline",
		},
		init = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline({}),
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline({}),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				mapping = cmp.mapping.preset.insert({
					[keys.completion.next] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					[keys.completion.previous] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					[keys.completion.scroll_docs_up] = cmp.mapping.scroll_docs(-4),
					[keys.completion.scroll_docs_down] = cmp.mapping.scroll_docs(4),
					[keys.completion.complete] = cmp.mapping.complete(),
					[keys.completion.abort] = cmp.mapping.abort(),
					[keys.completion.confirm] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "git" },
				}),
				experimental = {
					ghost_text = {
						hl_group = "LspInlayHint",
					},
				},
			})
		end,
	},
	{
		"petertriho/cmp-git",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
}
