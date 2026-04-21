local keys = require("config.keys")

require("gitsigns").setup({
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

		local map = function(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = buffer
			keys.map(mode, l, r, opts)
		end

		map("n", keys.git.next_hunk, gs.next_hunk, { desc = "Next Hunk" })
		map("n", keys.git.prev_hunk, gs.prev_hunk, { desc = "Prev Hunk" })
		map({ "n", "v" }, keys.git.stage_hunk, ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
		map({ "n", "v" }, keys.git.reset_hunk, ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
		map("n", keys.git.stage_buffer, gs.stage_buffer, { desc = "Stage Buffer" })
		map("n", keys.git.undo_stage_hunk, gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		map("n", keys.git.reset_buffer, gs.reset_buffer, { desc = "Reset Buffer" })
		map("n", keys.git.preview_hunk, gs.preview_hunk, { desc = "Preview Hunk" })
		map("n", keys.git.blame_line, function()
			gs.blame_line({ full = true })
		end, { desc = "Blame Line" })
		map("n", keys.git.diff, gs.diffthis, { desc = "Diff This" })
	end,
})
