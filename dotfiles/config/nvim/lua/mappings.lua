local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader to space
vim.g.mapleader = ' '

-- navigate properly when lines are wrapped
map('', 'j', 'gj', { silent = true })
map('', 'k', 'gk', { silent = true })

-- Copy to clipboard in normal, visual, select and operator modes
map('', '<leader>y', '"+y')
map('', '<leader>Y', '"+yg_')
map('', '<leader>yy', '"+yy')
map('', '<leader>p', '"+p')
map('', '<leader>P', '"+P')

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })

-- split
map('n', '<leader>sh', '<cmd>split<CR>', { silent = true })
map('n', '<leader>sv', '<cmd>vsplit<CR>', { silent = true })

-- no search highlight
map('n', '<leader><space>', '<cmd>noh<CR>', { silent = true })

-- maintain visual mode after shifting
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })

-- lsp
map('n', '<leader>rr', '<cmd>LspRestart<CR>')
map('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
map('v', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>')
map('n', 'gr', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>')
map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
map('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
map('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
map('n', 'ss', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>')
map('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>')
map('n', 'gd', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>')
map('n', '<leader>[', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>')
map('n', '<leader>]', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>')
map('n', '<leader>d', '<cmd>lua require"lspsaga.diagnostic".show_cursor_diagnostics()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader><C-i>', '<cmd>ClangdSwitchSourceHeader<CR>', { silent = true })

-- compe
vim.cmd([[
  inoremap <silent><expr> <C-Space> compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]])

-- nvim-tree
map('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

-- better window movement
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- nvim-bufferline
map('n', '<leader>j', '<cmd>BufferLineCyclePrev<CR>', { silent = true })
map('n', '<leader>k', '<cmd>BufferLineCycleNext<CR>', { silent = true })
map('n', '<leader>J', '<cmd>BufferLineMovePrev<CR>', { silent = true })
map('n', '<leader>K', '<cmd>BufferLineMoveNext<CR>', { silent = true })
map('n', '<leader>c', '<cmd>BufDel<CR>', { silent = true })
map('n', '<C-s>', '<cmd>BufferLinePick<CR>', { silent = true })

-- telescope
map('n', '<leader>e', '<CMD>Telescope find_files<CR>')
map('n', '<leader>rg', '<CMD>Telescope live_grep<CR>')

-- iswap
map('n', 'gs', '<cmd>ISwap<CR>', { silent = true })
