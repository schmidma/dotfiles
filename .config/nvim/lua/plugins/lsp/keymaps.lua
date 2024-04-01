local M = {}

local keys = require("keys")

function M.on_attach(client, buffer)
  if client.server_capabilities["codeActionProvider"] then
    vim.keymap.set({ "n", "v" }, keys.lsp.code_action, vim.lsp.buf.code_action, { buffer = buffer })
  end
  vim.keymap.set("n", keys.lsp.hover, vim.lsp.buf.hover, { buffer = buffer })
  if client.server_capabilities["renameProvider"] then
    vim.keymap.set("n", keys.lsp.rename, vim.lsp.buf.rename, { buffer = buffer })
  end
  if client.server_capabilities["definitionProvider"] then
    vim.keymap.set("n", keys.lsp.goto_definition, function()
      vim.cmd.Telescope("lsp_definitions")
    end, { buffer = buffer })
  end
  vim.keymap.set("n", keys.lsp.goto_references, function()
    vim.cmd.Telescope("lsp_references")
  end, { buffer = buffer })
  vim.keymap.set("n", keys.lsp.goto_declaration, vim.lsp.buf.declaration, { buffer = buffer })
  vim.keymap.set("n", keys.lsp.goto_implementations, function()
    vim.cmd.Telescope("lsp_implementations")
  end, { buffer = buffer })
  vim.keymap.set("n", keys.lsp.goto_type, function()
    vim.cmd.Telescope("lsp_type_definitions")
  end, { buffer = buffer })
  if client.server_capabilities["signatureHelpProvider"] then
    vim.keymap.set("n", keys.lsp.signature_help, vim.lsp.buf.signature_help, { buffer = buffer })
    vim.keymap.set("i", keys.lsp.signature_help, vim.lsp.buf.signature_help, { buffer = buffer })
  end

  vim.keymap.set("n", keys.diagnostic.goto_prev, vim.diagnostic.goto_prev, { buffer = buffer })
  vim.keymap.set("n", keys.diagnostic.goto_next, vim.diagnostic.goto_next, { buffer = buffer })
  vim.keymap.set("n", keys.diagnostic.open_float, vim.diagnostic.open_float, { buffer = buffer })
end

return M
