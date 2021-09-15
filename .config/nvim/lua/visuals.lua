vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {
  "qf", "vista_kind", "terminal", "packer", "NvimTree"
}

-- Load the colorscheme
vim.cmd [[syntax enable]]
vim.cmd [[colorscheme base16-default-dark]]

vim.api.nvim_command('hi StatusLine guibg=#282828')

vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})

vim.g.lsp_utils_location_opts = {mode = 'editor'}
vim.g.lsp_utils_symbols_opts = {mode = 'editor'}

local signs = {
  Error = " ",
  Warning = " ",
  Hint = " ",
  Information = " "
}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end
