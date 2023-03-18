local M = {}

function M.format_buffer()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format({
    bufnr = buf,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      end
      return client.name ~= "null-ls"
    end,
  })
end

M.autoformat = true

function M.toggle_autoformat()
  M.autoformat = not M.autoformat
  if M.autoformat then
    vim.notify("Enabled format on save", vim.log.levels.INFO, { title = "Format" })
  else
    vim.notify("Disabled format on save", vim.log.levels.INFO, { title = "Format" })
  end

end

function M.on_attach(client, buffer)
  if
    client.config
    and client.config.capabilities
    and client.config.capabilities.documentFormattingProvider == false
  then
    return
  end

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat." .. buffer, {}),
      buffer = buffer,
      callback = function()
        if M.autoformat then
          M.format_buffer()
        end
      end,
    })
  end
end

return M
