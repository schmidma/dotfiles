local M = {}

local keys = require("keys")

function M.on_attach(client, buffer)
	if client.server_capabilities["codeActionProvider"] then
		vim.keymap.set(
			{ "n", "v" },
			keys.lsp.code_action,
			vim.lsp.buf.code_action,
			{ buffer = buffer, desc = "Code action" }
		)
	end
	vim.keymap.set("n", keys.lsp.hover, vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })
	if client.server_capabilities["renameProvider"] then
		vim.keymap.set("n", keys.lsp.rename, vim.lsp.buf.rename, { buffer = buffer, desc = "Rename symbol" })
	end
	if client.server_capabilities["definitionProvider"] then
		vim.keymap.set("n", keys.lsp.goto_definition, function()
			vim.cmd.Telescope("lsp_definitions")
		end, { buffer = buffer, desc = "Go to definition" })
	end
	vim.keymap.set("n", keys.lsp.goto_references, function()
		vim.cmd.Telescope("lsp_references")
	end, { buffer = buffer, desc = "Go to references" })
	vim.keymap.set(
		"n",
		keys.lsp.goto_declaration,
		vim.lsp.buf.declaration,
		{ buffer = buffer, desc = "Go to declaration" }
	)
	vim.keymap.set("n", keys.lsp.goto_implementations, function()
		vim.cmd.Telescope("lsp_implementations")
	end, { buffer = buffer, desc = "Go to implementations" })
	vim.keymap.set("n", keys.lsp.goto_type, function()
		vim.cmd.Telescope("lsp_type_definitions")
	end, { buffer = buffer, desc = "Go to type definition" })
	if client.server_capabilities["signatureHelpProvider"] then
		vim.keymap.set(
			"n",
			keys.lsp.signature_help,
			vim.lsp.buf.signature_help,
			{ buffer = buffer, desc = "Signature help" }
		)
		vim.keymap.set(
			"i",
			keys.lsp.signature_help,
			vim.lsp.buf.signature_help,
			{ buffer = buffer, desc = "Signature help" }
		)
	end
end

return M
