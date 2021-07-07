vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }

-- Load the colorscheme
vim.cmd[[syntax enable]]
vim.cmd[[colorscheme base16-default-dark]]

vim.api.nvim_command('hi StatusLine guibg=#282828')
