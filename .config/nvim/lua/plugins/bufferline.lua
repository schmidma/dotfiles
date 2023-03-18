local keys = require("keys")

return {
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",
        offsets = { { filetype = "neo-tree", text = "󰙅 File Explorer", highlight = "Directory" } },
        diagnostics_indicator = function(_, _, diag)
          local icons = require("icons").diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { keys.buffer.prev, function() vim.cmd.BufferLineCyclePrev() end, desc = "Previous buffer" },
      { keys.buffer.next, function() vim.cmd.BufferLineCycleNext() end, desc = "Next buffer" },
      { keys.buffer.move_prev, function() vim.cmd.BufferLineMovePrev() end, desc = "Move to buffer left" },
      { keys.buffer.move_next, function() vim.cmd.BufferLineMoveNext() end, desc = "Move to buffer right" },
      { keys.buffer.pick, function() vim.cmd.BufferLinePick() end, desc = "Pick buffer" },
    }
  }
}
