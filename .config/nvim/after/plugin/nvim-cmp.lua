-- Don't pass messages to |ins-completion-menu|
vim.cmd("set shortmess+=c")

local lspkind = require("lspkind")
lspkind.init()

-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buf]",
				nvim_lsp = "[LSP]",
				luasnip = "[snip]",
				nvim_lua = "[api]",
			},
		}),
	},
	mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 'c' }),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
