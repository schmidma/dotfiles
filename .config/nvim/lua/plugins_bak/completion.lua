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
		config = function()
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
				window = {
					documentation = {
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					},
				},
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
					[keys.completion.next] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					[keys.completion.previous] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
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
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			local suggestion = require("copilot.suggestion")
			local cmp = require("cmp")

			cmp.event:on("menu_opened", function()
				suggestion.dismiss()
				vim.b.copilot_suggestion_hidden = true
			end)
			cmp.event:on("menu_closed", function()
				vim.b.copilot_suggestion_hidden = false
			end)

			vim.keymap.set("i", keys.completion.copilot.next, function()
				cmp.close()
				suggestion.next()
			end)
			vim.keymap.set("i", keys.completion.copilot.previous, function()
				cmp.close()
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
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				keys.snippets.expand_or_jump,
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				keys.snippets.expand_or_jump,
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				keys.snippets.jump_prev,
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},
}
