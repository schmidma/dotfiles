local fn = vim.fn

-- Auto install packer.nivm if not exist
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.api.nvim_command 'packadd packer.nvim'
end

require('plugins')
require('mappings')
require('settings')
require('visuals')
require('autocommands')

-- Setup lsp
require('lsp')

