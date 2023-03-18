local keys = require("keys")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { keys.toggle_file_tree, function() vim.cmd.Neotree("toggle") end, "NeoTree" }
    },
    opts = {
      window = {
        width = 30,
        mappings = {
          ["o"] = "open",
        }
      }
    }
  },
}
