local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function map_telescope(map_key, picker)
  local rhs = string.format([[<cmd>lua require('telescope.builtin').%s()<cr>]], picker)
  map('n', map_key, rhs)
end

-- Map leader to space
vim.g.mapleader = ' '

-- navigate properly when lines are wrapped
map('', 'j', 'gj')
map('', 'k', 'gk')

-- Copy to clipboard in normal, visual, select and operator modes
map('', '<leader>y', '"+y')
map('', '<leader>Y', '"+yg_')
map('', '<leader>p', '"+p')
map('', '<leader>P', '"+P')

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- split
map('n', '<leader>sh', '<cmd>split<CR>')
map('n', '<leader>sv', '<cmd>vsplit<CR>')

-- no search highlight
map('n', '<leader><space>', '<cmd>noh<CR>')

-- maintain visual mode after shifting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- LSP management
map('n', '<leader>lr', ':LspRestart<CR>')
map('n', '<leader>li', ':LspInfo<CR>')
map('n', '<leader>ls', ':LspStart<CR>')
map('n', '<leader>lt', ':LspStop<CR>')

-- lsp
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'si', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<leader>]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader><C-i>', '<cmd>ClangdSwitchSourceHeader<CR>')

-- nvim-tree
map('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>')

-- better window movement
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- nvim-bufferline
map('n', '<leader>j', '<cmd>BufferLineCyclePrev<CR>')
map('n', '<leader>k', '<cmd>BufferLineCycleNext<CR>')
map('n', '<leader>J', '<cmd>BufferLineMovePrev<CR>')
map('n', '<leader>K', '<cmd>BufferLineMoveNext<CR>')
map('n', '<leader>c', '<cmd>BufDel<CR>')
map('n', '<C-s>', '<cmd>BufferLinePick<CR>')

-- telescope
map_telescope('<leader>qf', 'lsp_code_actions')
map_telescope('gd', 'lsp_definitions')
map_telescope('gr', 'lsp_references')
map_telescope('<leader>e', 'find_files')
map_telescope('<leader>/', 'current_buffer_fuzzy_find')
map_telescope('<leader>rg', 'live_grep')
map_telescope('<leader>gb', 'git_branches')
map_telescope('<leader>gs', 'git_status')

-- iswap
map('n', 'gs', '<cmd>ISwap<CR>')
