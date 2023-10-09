local keys = require("keys")

vim.g.mapleader = keys.leader
vim.g.maplocalleader = ","

-- navigate properly when lines are wrapped
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

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
vim.keymap.set({ "n", "v" }, keys.yank_to_clipboard, [["+y]])
vim.keymap.set("n", "Q", "<nop>")

-- write shortcuts
vim.keymap.set("n", keys.write, vim.cmd.write)

-- hide search highlight
vim.keymap.set("n", keys.hide_search_highlight, vim.cmd.noh)

-- Copy to clipboard in normal, visual, select and operator modes
vim.keymap.set({ "n", "v" }, keys.yank_to_clipboard, [["+y]])
vim.keymap.set({ "n", "v" }, keys.paste_from_clipboard, [["+p]])

-- movement
vim.keymap.set({ "n", "v" }, keys.movement.start_of_line, "0")
vim.keymap.set({ "n", "v" }, keys.movement.end_of_line, "$")

-- redo to 'U'
vim.keymap.set("n", keys.redo, "<C-r>")

-- better window movement
vim.keymap.set("n", keys.split_navigation.left, "<C-w>h")
vim.keymap.set("n", keys.split_navigation.down, "<C-w>j")
vim.keymap.set("n", keys.split_navigation.up, "<C-w>k")
vim.keymap.set("n", keys.split_navigation.right, "<C-w>l")
