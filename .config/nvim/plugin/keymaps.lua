local keys = require("keys")

local function set_keymaps(mode, lhs_list, rhs, opts)
	if type(lhs_list) == "string" then
		lhs_list = { lhs_list }
	end
	for _, lhs in ipairs(lhs_list) do
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- navigate properly when lines are wrapped
set_keymaps({ "n", "v" }, "j", "gj")
set_keymaps({ "n", "v" }, "k", "gk")
set_keymaps({ "n", "v" }, "<Down>", "gj")
set_keymaps({ "n", "v" }, "<Up>", "gk")

-- matching items
set_keymaps({ "n", "v" }, keys.movement.matching_item, "%", { silent = true, desc = "Jump to matching item" })

-- maintain visual mode after shifting
set_keymaps("v", "<", "<gv")
set_keymaps("v", ">", ">gv")

-- do not move cursor when joining lines
set_keymaps("n", "J", "mzJ`z")

-- center window after page up/down
set_keymaps("n", "<C-d>", "<C-d>zz")
set_keymaps("n", "<C-u>", "<C-u>zz")

-- center window after search
set_keymaps("n", "n", "nzzzv")
set_keymaps("n", "N", "Nzzzv")

-- swap p and P
set_keymaps("x", "p", "P")
set_keymaps("x", "P", "p")

-- nobody needs this
set_keymaps("n", "Q", "<nop>")

-- write shortcuts
set_keymaps("n", keys.write, vim.cmd.write, { desc = "Write buffer" })

-- hide search highlight
set_keymaps("n", keys.hide_search_highlight, vim.cmd.nohlsearch, { desc = "Hide search highlight" })

-- Copy and paste with system clipboard
set_keymaps({ "n", "x" }, keys.yank_to_clipboard, [["+y]], { desc = "Yank to clipboard" })
set_keymaps({ "n", "x" }, keys.paste_from_clipboard, [["+p]], { desc = "Paste from clipboard" })

-- movement
set_keymaps({ "n", "x" }, keys.movement.start_of_line, "g0", { desc = "Move to start of line" })
set_keymaps(
	{ "n", "x" },
	keys.movement.start_non_whitespace_of_line,
	"g^",
	{ desc = "Move to first non whitespace character of line" }
)
set_keymaps({ "n", "x" }, keys.movement.end_of_line, "g$", { desc = "Move to end of line" })

-- redo to 'U'
set_keymaps("n", keys.redo, "<C-r>", { desc = "Redo" })

-- close window
set_keymaps("n", keys.close_window, "<C-w><C-q>", { desc = "Close window" })

-- better window movement
set_keymaps("n", keys.split_navigation.left, "<C-w><C-h>")
set_keymaps("n", keys.split_navigation.down, "<C-w><C-j>")
set_keymaps("n", keys.split_navigation.up, "<C-w><C-k>")
set_keymaps("n", keys.split_navigation.right, "<C-w><C-l>")

-- do not exit insert mode on C-c
set_keymaps("i", "<C-c>", "<Nop>")

-- escape terminal mode
set_keymaps("t", "<Esc><Esc>", "<C-\\><C-n>")

-- diagnostics
set_keymaps("n", keys.diagnostic.open_float, vim.diagnostic.open_float, { desc = "Open diagnostic float" })

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
