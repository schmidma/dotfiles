local keys = require("keys")

-- navigate properly when lines are wrapped
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

-- matching items
vim.keymap.set({ "n", "v" }, keys.movement.matching_item, "%", { silent = true, desc = "Jump to matching item" })

-- maintain visual mode after shifting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- do not move cursor when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- center window after page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center window after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- swap p and P
vim.keymap.set("x", "p", "P")
vim.keymap.set("x", "P", "p")

-- nobody needs this
vim.keymap.set("n", "Q", "<nop>")

-- write shortcuts
vim.keymap.set("n", keys.write, vim.cmd.write, { desc = "Write buffer" })

-- hide search highlight
vim.keymap.set("n", keys.hide_search_highlight, vim.cmd.nohlsearch, { desc = "Hide search highlight" })

-- Copy and paste with system clipboard
vim.keymap.set({ "n", "x" }, keys.yank_to_clipboard, [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "x" }, keys.paste_from_clipboard, [["+p]], { desc = "Paste from clipboard" })

-- movement
vim.keymap.set({ "n", "x" }, keys.movement.start_of_line, "g0", { desc = "Move to start of line" })
vim.keymap.set({ "n", "x" }, keys.movement.end_of_line, "g$", { desc = "Move to end of line" })

-- redo to 'U'
vim.keymap.set("n", keys.redo, "<C-r>", { desc = "Redo" })

-- close window
vim.keymap.set("n", keys.close_window, "<C-w><C-q>", { desc = "Close window" })

-- better window movement
vim.keymap.set("n", keys.split_navigation.left, "<C-w><C-h>")
vim.keymap.set("n", keys.split_navigation.down, "<C-w><C-j>")
vim.keymap.set("n", keys.split_navigation.up, "<C-w><C-k>")
vim.keymap.set("n", keys.split_navigation.right, "<C-w><C-l>")

-- do not exit insert mode on C-c
vim.keymap.set("i", "<C-c>", "<Nop>")

-- escape terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- diagnostics
vim.keymap.set("n", keys.diagnostic.open_float, vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- mistyped quits
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WA", "wa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("WQA", "wqa", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("QA", "qa", {})
