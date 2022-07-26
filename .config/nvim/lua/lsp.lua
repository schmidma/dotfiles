local lsp_status = require("lsp-status")
lsp_status.register_progress()
lsp_status.config({
  diagnostics = false,
  status_symbol = "",
  current_function = false,
})

-- set rounded borders by default
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local nvim_lspconfig = require("lspconfig")
nvim_lspconfig.jsonls.setup({})
nvim_lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
nvim_lspconfig.pyright.setup({})

local lspconfig_win = require("lspconfig.ui.windows")
local _default_opts = lspconfig_win.default_opts
lspconfig_win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = "single"
  return opts
end

-- fancy symbols
require("lspkind").init({})

-- mappings
local nmap = require("keymap").nmap

-- commands
nmap("<leader>qf", vim.lsp.buf.code_action)
nmap("K", vim.lsp.buf.hover)
nmap("si", vim.lsp.buf.signature_help)
nmap("<leader>rn", vim.lsp.buf.rename)
nmap("<leader>[", vim.diagnostic.goto_prev)
nmap("<leader>]", vim.diagnostic.goto_next)
nmap("<leader>d", vim.diagnostic.open_float)
nmap("<leader>f", vim.lsp.buf.formatting)
nmap("<leader><C-i>", "<cmd>ClangdSwitchSourceHeader<CR>")
