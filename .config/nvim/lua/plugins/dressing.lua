return {
  {
    "stevearc/dressing.nvim",
    opts = function()
      return {
        select = {
          telescope = require("telescope.themes").get_cursor({}),
        },
      }
    end,
  },
}
