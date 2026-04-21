local keys = require("config.keys")
local map = keys.map

local function command(name, rhs, opts)
	pcall(vim.api.nvim_del_user_command, name)
	vim.api.nvim_create_user_command(name, rhs, opts or {})
end

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("n", "J", "mzJ`z", { desc = "Join lines" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })
map("x", "p", "P", { desc = "Paste without yanking replaced text" })
map("x", "P", "p", { desc = "Paste with yanking replaced text" })
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", keys.write, vim.cmd.write, { desc = "Write buffer" })
map("n", keys.close_window, "<C-w><C-q>", { desc = "Close window" })
map("n", keys.split_navigation.left, "<C-w><C-h>", { desc = "Go to left split" })
map("n", keys.split_navigation.down, "<C-w><C-j>", { desc = "Go to lower split" })
map("n", keys.split_navigation.up, "<C-w><C-k>", { desc = "Go to upper split" })
map("n", keys.split_navigation.right, "<C-w><C-l>", { desc = "Go to right split" })
map("n", keys.clear_search_highlight, vim.cmd.nohlsearch, { desc = "Clear search highlight" })

map({ "n", "x" }, keys.clipboard.yank, '"+y', { desc = "Yank to system clipboard" })
map("n", keys.clipboard.yank_line, '"+Y', { desc = "Yank line to system clipboard" })
map({ "n", "x" }, keys.clipboard.paste, '"+p', { desc = "Paste from system clipboard" })
map({ "n", "x" }, keys.clipboard.paste_before, '"+P', { desc = "Paste before from system clipboard" })

map({ "n", "x" }, keys.movement.start_of_line, "g0", { desc = "Move to start of line" })
map(
	{ "n", "x" },
	keys.movement.start_non_whitespace_of_line,
	"g^",
	{ desc = "Move to first non whitespace character of line" }
)
map({ "n", "x" }, keys.movement.end_of_line, "g$", { desc = "Move to end of line" })
map({ "n", "v" }, keys.movement.matching_item, "%", { silent = true, desc = "Jump to matching item" })

for _, alias in ipairs({
	{ "W", "w" },
	{ "Q", "q" },
	{ "Wq", "wq" },
	{ "WQ", "wq" },
	{ "Wa", "wa" },
	{ "WA", "wa" },
	{ "Wqa", "wqa" },
	{ "WQa", "wqa" },
	{ "WQA", "wqa" },
	{ "Qa", "qa" },
	{ "QA", "qa" },
}) do
	command(alias[1], alias[2])
end
