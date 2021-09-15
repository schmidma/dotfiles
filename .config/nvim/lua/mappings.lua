local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = ' '

-- navigate properly when lines are wrapped
map('', 'j', 'gj', {silent = true})
map('', 'k', 'gk', {silent = true})

-- Copy to clipboard in normal, visual, select and operator modes
map('', '<leader>y', '"+y')
map('', '<leader>Y', '"+yg_')
map('', '<leader>p', '"+p')
map('', '<leader>P', '"+P')

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- split
map('n', '<leader>sh', '<cmd>split<CR>', {silent = true})
map('n', '<leader>sv', '<cmd>vsplit<CR>', {silent = true})

-- no search highlight
map('n', '<leader><space>', '<cmd>noh<CR>', {silent = true})

-- maintain visual mode after shifting
map('v', '<', '<gv', {silent = true})
map('v', '>', '>gv', {silent = true})

-- LSP management
map('n', '<leader>lr', ':LspRestart<CR>', {noremap = true, silent = true})
map('n', '<leader>li', ':LspInfo<CR>', {noremap = true, silent = true})
map('n', '<leader>ls', ':LspStart<CR>', {noremap = true, silent = true})
map('n', '<leader>lt', ':LspStop<CR>', {noremap = true, silent = true})

-- lsp
map('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('v', '<leader>qf', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'si', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>[',
    '<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>')
map('n', '<leader>]',
    '<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>')
map('n', '<leader>d',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader><C-i>', '<cmd>ClangdSwitchSourceHeader<CR>', {silent = true})

-- compe
vim.cmd([[
  inoremap <silent><expr> <C-Space> compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]])

-- nvim-tree
map('n', '<leader>nt', '<cmd>NvimTreeToggle<CR>',
    {noremap = true, silent = true})

-- better window movement
map('n', '<C-h>', '<C-w>h', {silent = true})
map('n', '<C-j>', '<C-w>j', {silent = true})
map('n', '<C-k>', '<C-w>k', {silent = true})
map('n', '<C-l>', '<C-w>l', {silent = true})

-- nvim-bufferline
map('n', '<leader>j', '<cmd>BufferLineCyclePrev<CR>', {silent = true})
map('n', '<leader>k', '<cmd>BufferLineCycleNext<CR>', {silent = true})
map('n', '<leader>J', '<cmd>BufferLineMovePrev<CR>', {silent = true})
map('n', '<leader>K', '<cmd>BufferLineMoveNext<CR>', {silent = true})
map('n', '<leader>c', '<cmd>BufDel<CR>', {silent = true})
map('n', '<C-s>', '<cmd>BufferLinePick<CR>', {silent = true})

-- telescope
map('n', '<leader>e',
    [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<cr>]],
    {noremap = true, silent = true})
map('n', '<leader>/',
    [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]],
    {noremap = true, silent = true})
map('n', '<leader>rg',
    [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
    {noremap = true, silent = true})
map('n', '<leader>gb',
    [[<cmd>lua require('telescope.builtin').git_branches()<cr>]],
    {noremap = true, silent = true})
map('n', '<leader>gs',
    [[<cmd>lua require('telescope.builtin').git_status()<cr>]],
    {noremap = true, silent = true})

-- iswap
map('n', 'gs', '<cmd>ISwap<CR>', {silent = true})
