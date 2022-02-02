local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config {
  diagnostics = false,
  status_symbol = '',
  current_function = false
}

-- set rounded borders by default
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'rounded'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	server:setup({})
	vim.cmd([[ do User LspAttachBuffers ]])
end)

local lspconfig_win = require('lspconfig.ui.windows')
local _default_opts = lspconfig_win.default_opts
lspconfig_win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'single'
  return opts
end

-- fancy symbols
require('lspkind').init {}
