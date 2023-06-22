local function register_lsp_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

local custom_server_setup = {
	["rust_analyzer"] = function(opts)
		require("rust-tools").setup(opts)
	end,
}

local function setup_borders(opts)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = opts.float.border })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = opts.float.border })
	require("lspconfig.ui.windows").default_options = { border = opts.float.border }
	vim.diagnostic.config(opts)
end

local function setup_diagnostic_signs()
	for name, icon in pairs(require("icons").diagnostics) do
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
end

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "texlab" },
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
		opts = {
			ensure_installed = { "stylua", "misspell", "markdownlint", "proselint", "prettier" },
			automatic_setup = true,
		},
		config = function(_, opts)
			require("mason-null-ls").setup(opts)
			local null_ls = require("null-ls")
			null_ls.setup({})
			require("mason-null-ls").setup({
				handlers = {
					misspell = function(_, _)
						null_ls.register(null_ls.builtins.diagnostics.misspell.with({
							method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
						}))
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"mason-lspconfig.nvim",
			"mason-null-ls.nvim",
			"fidget.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"simrat39/rust-tools.nvim",
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
				float = { border = "rounded" },
			},
			manual_register = { "rust_analyzer" },
		},
		config = function(_, opts)
			register_lsp_attach(function(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
			end)
			setup_diagnostic_signs()
			setup_borders(opts.diagnostics)

			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local function setup(server)
				local server_options = require("plugins.lsp.server_options")[server] or {}
				local options = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, server_options)
				if custom_server_setup[server] then
					custom_server_setup[server](options)
				else
					require("lspconfig")[server].setup(options)
				end
			end
			require("mason-lspconfig").setup_handlers({ setup })

			for _, server in ipairs(opts.manual_register) do
				setup(server)
			end
		end,
	},
	{
		"j-hui/fidget.nvim",
		lazy = true,
		opts = {
			text = {
				spinner = "meter",
			},
		},
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		config = true,
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
		opts = {
			name = { "venv", ".venv" },
		},
	},
	{
		"github/copilot.vim",
	},
}
