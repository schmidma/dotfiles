local keys = require("keys")

vim.g.mapleader = keys.leader
vim.g.maplocalleader = keys.leader

-- navigate properly when lines are wrapped
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

-- matching items
vim.keymap.set({ "n", "v" }, keys.movement.matching_item, "%", { silent = true, desc = "Jump to matching item" })

-- maintain visual mode after shifting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- ???
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "R", [["_dP]])
vim.keymap.set("x", "p", "P")
vim.keymap.set("x", "P", "p")
vim.keymap.set({ "n", "v" }, keys.yank_to_clipboard, [["+y]])
vim.keymap.set("n", "Q", "<nop>")

-- write shortcuts
vim.keymap.set("n", keys.write, vim.cmd.write, { desc = "Write buffer" })

-- hide search highlight
vim.keymap.set("n", keys.hide_search_highlight, vim.cmd.nohlsearch, { desc = "Hide search highlight" })

-- Copy to clipboard in normal, visual, select and operator modes
vim.keymap.set({ "n", "v" }, keys.yank_to_clipboard, [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, keys.paste_from_clipboard, [["+p]], { desc = "Paste from clipboard" })

-- movement
vim.keymap.set({ "n", "v" }, keys.movement.start_of_line, "g0", { desc = "Move to start of line" })
vim.keymap.set({ "n", "v" }, keys.movement.end_of_line, "g$", { desc = "Move to end of line" })

-- redo to 'U'
vim.keymap.set("n", keys.redo, "<C-r>", { desc = "Redo" })

-- close window
vim.keymap.set("n", keys.close_window, "<C-w><C-q>", { desc = "Close window" })

-- better window movement
vim.keymap.set("n", keys.split_navigation.left, "<C-w><C-h>")
vim.keymap.set("n", keys.split_navigation.down, "<C-w><C-j>")
vim.keymap.set("n", keys.split_navigation.up, "<C-w><C-k>")
vim.keymap.set("n", keys.split_navigation.right, "<C-w><C-l>")

-- terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- diagnostics
vim.keymap.set("n", keys.diagnostic.goto_prev, vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", keys.diagnostic.goto_next, vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", keys.diagnostic.open_float, vim.diagnostic.open_float, { desc = "Open diagnostic float" })
