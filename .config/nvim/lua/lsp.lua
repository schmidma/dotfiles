local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config {
  diagnostics = false,
  status_symbol = '',
  current_function = false
}

local on_attach = function(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]])
  end
  lsp_status.on_attach(client)
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';')
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
      }
    }
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = lsp_status.capabilities
  -- enable snippet support
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {capabilities = capabilities, on_attach = on_attach}
end

-- lsp-install
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()
  -- ... and add manually installed servers
  table.insert(servers, "clangd")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then config.settings = lua_settings end
    if server == "clangd" then
      config.cmd = {
        "clangd", "--background-index",
        "--query-driver=/opt/HULKs-OS/*/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/*"
      }
      config.handlers = lsp_status.extensions.clangd.setup()
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- fancy symbols
require('lspkind').init {}
