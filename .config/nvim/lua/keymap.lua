local keys = {
	leader = " ",
	yank_to_clipboard = "<leader>y",
	paste_from_clipboard = "<leader>p",
	stop_search_highlight = "<leader><leader>",
	buffer = {
		prev = "<leader>j",
		next = "<leader>k",
		pick = "<C-s>",
		close = "<leader>c",
	},
	open_file_selection = "<leader>e",
	grep_string = "<leader>rg",
	toggle_file_tree = "<leader>nt",
	split_horizontal = "<leader>sh",
	split_vertical = "<leader>sv",
	split_navigation = {
		left = "<C-h>",
		down = "<C-j>",
		up = "<C-k>",
		right = "<C-l>",
	},
	iswap = "gs",
	lsp = {
		code_action = "<leader>qf",
		hover = "K",
		signature_help = "si",
		rename = "<leader>rn",
		format = "<leader>f",
		goto_definition = "gd",
		goto_type = "gt",
		goto_references = "gr",
	},
	diagnostic = {
		goto_prev = "<leader>[",
		goto_next = "<leader>]",
		open_float = "<leader>d",
		show_list = "<leader>l",
	},
	git = {
		reset_hunk = "<leader>hr",
		preview_hunk = "<leader>hp",
		blame_line = "<leader>bl",
		branches = "<leader>gb",
		status = "<leader>gs",
		coauthors = "<leader>ga",
	},
	snippets = {
		expand_or_jump = "<C-k>",
		jump_prev = "<C-j>",
		change_choice = "<C-l>",
		select_choice = "<C-u>",
	},
	completion = {
		scroll_docs_down = "<C-d>",
		scroll_docs_up = "<C-u>",
		trigger = "<C-Space>",
		next = "<C-n>",
		prev = "<C-p>",
		close = "<C-e>",
		confirm = "<C-y>",
	}
}

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local function imap(lhs, rhs, opts)
	map("i", lhs, rhs, opts)
end

local function nmap(lhs, rhs, opts)
	map("n", lhs, rhs, opts)
end

-- Map leader to space
vim.g.mapleader = keys.leader

-- navigate properly when lines are wrapped
map("", "j", "gj")
map("", "k", "gk")

-- Copy to clipboard in normal, visual, select and operator modes
map("", keys.yank_to_clipboard, '"+y')
map("", keys.paste_from_clipboard, '"+p')

-- split
nmap(keys.split_horizontal, "<cmd>split<CR>")
nmap(keys.split_vertical, "<cmd>vsplit<CR>")

-- no search highlight
nmap(keys.stop_search_highlight, "<cmd>noh<CR>")

-- maintain visual mode after shifting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better window movement
nmap(keys.split_navigation.left, "<C-w>h")
nmap(keys.split_navigation.down, "<C-w>j")
nmap(keys.split_navigation.up, "<C-w>k")
nmap(keys.split_navigation.right, "<C-w>l")

return {
	map = map,
	imap = imap,
	nmap = nmap,
	keys = keys,
}
