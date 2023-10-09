local keys = require("keys")

return {
	{
		"echasnovski/mini.ai",
		dependencies = { "nvim-treesitter-textobjects" },
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},
	{
		"echasnovski/mini.surround",
		keys = {
			{ keys.surround.add, desc = "Add surrounding", mode = { "n", "v" } },
			{ keys.surround.delete, desc = "Delete surrounding" },
			{ keys.surround.find, desc = "Find surrounding" },
			{ keys.surround.find_left, desc = "Find left surrounding" },
			{ keys.surround.highlight, desc = "Hightlight surrounding" },
			{ keys.surround.replace, desc = "Replace surrounding" },
		},
		opts = {
			mappings = {
				add = keys.surround.add,
				delete = keys.surround.delete,
				find = keys.surround.find,
				find_left = keys.surround.find_left,
				highlight = keys.surround.highlight,
				replace = keys.surround.replace,
			},
		},
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
			mappings = {
				comment = keys.comment.comment,
				comment_line = keys.comment.comment_line,
				text_object = keys.comment.text_object,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "┊",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				keys.buffer.close,
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete Buffer",
			},
			{
				keys.buffer.close_force,
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},
}
