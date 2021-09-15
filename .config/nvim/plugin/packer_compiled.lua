-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/schmidma/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/schmidma/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/schmidma/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/schmidma/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/schmidma/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/coq.thirdparty"
  },
  coq_nvim = {
    config = { "\27LJ\1\2=\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\14--shut-up\bNow\bcoq\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/coq_nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins/galaxyline\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26plugins/gitsigns-nvim\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["iswap.nvim"] = {
    commands = { "ISwap", "ISwapWith" },
    loaded = false,
    needs_bufread = false,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/opt/iswap.nvim"
  },
  kommentary = {
    config = { "\27LJ\1\2|\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27plugins/nvim-autopairs\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-base16"
  },
  ["nvim-bufdel"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-bufdel"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28plugins/nvim-bufferline\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    config = { "\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26plugins/nvim-lsputils\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28plugins/nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins/rust-tools\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27plugins/nvim-telescope\frequire\0" },
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/schmidma/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28plugins/nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\14--shut-up\bNow\bcoq\frequire\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27plugins/nvim-telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\1\2|\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26plugins/gitsigns-nvim\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lsputils
time([[Config for nvim-lsputils]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26plugins/nvim-lsputils\frequire\0", "config", "nvim-lsputils")
time([[Config for nvim-lsputils]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins/galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins/rust-tools\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28plugins/nvim-bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ISwap lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ISwapWith lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwapWith", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
