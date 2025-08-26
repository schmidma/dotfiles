return {
  {
    "mfussenegger/nvim-lint",
    init = function()
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        markdown = { "proselint" },
      }
    end,
  }
}
