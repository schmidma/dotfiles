local keys = require("config.keys")

return {
  {
    "linux-cultist/venv-selector.nvim",
    cmd = { "VenvSelect" },
    ft = { "python" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      name = { "venv", ".venv" },
    },
    config = true,
    keys = {
      { keys.select_venv, vim.cmd.VenvSelect },
    },
  },
}
