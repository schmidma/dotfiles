
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    -- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", },
    opts = {
      ensure_installed = { "help", "c", "lua", "rust", "vim", "regex", "bash", "markdown_inline" },
      auto_install = true,
      highlight = {
        enable = true,
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
  },
  {
    "nvim-treesitter/playground",
    cmd = {
      "TSPlaygroundToggle"
    }
  }
}
