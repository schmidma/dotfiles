vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.spelllang = "en,de"
vim.opt.updatetime = 250
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.showcmd = false
vim.opt.shm = "I"

if vim.g.neovide then
	vim.o.guifont = "FiraMono Nerd Font:h14"
end
