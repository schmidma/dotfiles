local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config {
  diagnostics = false,
  status_symbol = '',
  current_function = false
}

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local default_opts = {}

	local server_opts = {
		["clangd"] = function()
			default_opts.cmd = {
				vim.fn.stdpath("data") .. "/lsp_servers/clangd/clangd",
				"--background-index",
				"--query-driver=/opt/HULKs-OS/*/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/*"
			}
			return default_opts
		end,
	}

	-- We check to see if any custom server_opts exist for the LSP server, if so, load them, if not, use our default_opts
	server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

local servers = require "nvim-lsp-installer.servers"
local server = require "nvim-lsp-installer.server"
local shell = require "nvim-lsp-installer.installers.shell"

local server_name = "julials"
local root_dir = server.get_server_root_path(server_name)

local juliaserver = server.Server:new{
    name = server_name,
    root_dir = root_dir,
    homepage = "https://github.com/julia-vscode/LanguageServer.jl",
    installer = shell.bash [[ julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")' ]],
    default_options = {}
}

-- overload the uninstall method
function juliaserver:uninstall()
  shell.bash[[ julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.remove("LanguageServer")' ]]
end

servers.register(juliaserver)

-- fancy symbols
require('lspkind').init {}
