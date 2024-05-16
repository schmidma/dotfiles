-- appropriate number of spaces to insert a <Tab>
vim.opt.expandtab = true
-- Number of spaces that a <Tab> counts for
vim.opt.tabstop = 2
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- keep buffers hidden when abandoned
vim.opt.hidden = true

-- split new windows below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Enables 24-bit RGB color
vim.opt.termguicolors = true

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 15

-- always show the sign column
vim.opt.signcolumn = "yes"

-- case-insensitive searching unless \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- default spell language
vim.opt.spelllang = "en,de"

-- decrease update time for CursorHold
vim.opt.updatetime = 250

-- do not show commands in the last line
vim.opt.showcmd = false

-- do not show mode in the last line, it is already shown in the statusline
vim.opt.showmode = false

-- wrapped lines will continue visually indented
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- Preview substitutions live
vim.opt.inccommand = "split"

-- don't give the intro message
vim.opt.shortmess:append("I")

-- font for neovide
if vim.g.neovide then
	vim.o.guifont = "FiraMono Nerd Font:h14"
end
