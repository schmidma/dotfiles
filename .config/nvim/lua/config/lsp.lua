local keys = require("config.keys")

local group = vim.api.nvim_create_augroup("config_lsp_attach", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		local map = function(lhs, rhs, desc, mode)
			keys.map(mode or "n", lhs, rhs, {
				buffer = ev.buf,
				desc = desc,
			})
		end

		map(keys.lsp.code_action, vim.lsp.buf.code_action, "Code actions", { "n", "x" })
		map(keys.lsp.declaration, vim.lsp.buf.declaration, "Go to declaration")
		map(keys.lsp.definition, Snacks.picker.lsp_definitions, "Go to definition")
		map(keys.lsp.document_symbol, Snacks.picker.lsp_symbols, "Document symbol")
		map(keys.lsp.hover, vim.lsp.buf.hover, "Hover")
		map(keys.lsp.implementation, Snacks.picker.lsp_implementations, "Go to implementation")
		map(keys.lsp.references, Snacks.picker.lsp_references, "List references")
		map(keys.lsp.rename, vim.lsp.buf.rename, "Rename symbol")
		map(keys.lsp.signature_help, vim.lsp.buf.signature_help, "Signature help", "i")
		map(keys.lsp.type_definition, Snacks.picker.lsp_type_definitions, "Go to type definition")
		map(keys.lsp.workspace_symbol, Snacks.picker.lsp_workspace_symbols, "List workspace symbols")
	end,
})

keys.map("n", keys.diagnostics.line, function()
	vim.diagnostic.open_float(nil, {
		scope = "line",
		source = "if_many",
		focusable = true,
	})
end, { desc = "Line diagnostics" })

vim.lsp.enable({ "lua_ls", "rust_analyzer", "ty", "ruff", "texlab", "harper_ls" })
