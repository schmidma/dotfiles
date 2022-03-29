-- Load the colorscheme
vim.cmd([[syntax enable]])
vim.cmd([[colorscheme base16-default-dark]])

vim.api.nvim_command("hi StatusLine guibg=#282828")

vim.diagnostic.config({ float = { border = "rounded" } })

vim.g.lsp_utils_location_opts = { mode = "editor" }
vim.g.lsp_utils_symbols_opts = { mode = "editor" }

local signs = {
	Error = " ",
	Warning = " ",
	Hint = " ",
	Information = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
