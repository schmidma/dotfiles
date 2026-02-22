return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      local kanagawa = require("kanagawa")
      kanagawa.setup({
        dimInactive = true,
        overrides = function(colors)
          local theme = colors.theme
          return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      })
      kanagawa.load()
    end,
  },
}
