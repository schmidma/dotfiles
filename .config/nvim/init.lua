-- Auto install packer.nivm if not exist
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"


if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require("plugins")
require("keymap")
require("settings")
require("visuals")
require("autocommands")

-- Setup lsp
require("lsp")
