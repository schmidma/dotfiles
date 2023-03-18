local keys = require("keys")

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", keys.git.next_hunk, gs.next_hunk, "Next Hunk")
        map("n", keys.git.prev_hunk, gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, keys.git.stage_hunk, ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, keys.git.reset_hunk, ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", keys.git.stage_buffer, gs.stage_buffer, "Stage Buffer")
        map("n", keys.git.undo_stage_hunk, gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", keys.git.reset_buffer, gs.reset_buffer, "Reset Buffer")
        map("n", keys.git.preview_hunk, gs.preview_hunk, "Preview Hunk")
        map("n", keys.git.blame_line, function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", keys.git.diff, gs.diffthis, "Diff This")
      end,
    },
  },
}
