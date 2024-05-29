local keys = {
	leader = " ",
	write = "<leader>w",
	movement = {
		start_of_line = "gh",
		end_of_line = "gl",
		matching_item = "mm",
	},
	close_window = "<leader>q",
	dismiss_notifications = "<leader>;",
	yank_to_clipboard = "<leader>y",
	paste_from_clipboard = "<leader>p",
	hide_search_highlight = ";",
	redo = "U",
	buffer = {
		prev = "gj",
		next = "gk",
		move_prev = "gJ",
		move_next = "gK",
		pick = "<C-s>",
		close = "<leader>c",
		close_force = "<leader>C",
	},
	trouble = {
		document_diagnostics = "<leader>xx",
		workspace_diagnostics = "<leader>xw",
		location_list = "<leader>xL",
		quickfix_list = "<leader>xQ",
	},
	magma = {
		init = "<localleader>i",
		enter_output = "<localleader><return>",
		evaluate_operator = "<localleader>r",
		evaluate_visual = "<localleader>r",
		evaluate_line = "<localleader>rr",
		reevaluate_cell = "<localleader>rc",
		delete = "<localleader>rd",
	},
	resume_selection = "<leader><tab>",
	open_file_selection = "<leader>e",
	show_buffers = "<leader>,",
	live_grep = "<leader>/",
	command_history = "<leader>:",
	show_keymaps = "<leader>?",
	files = {
		open = "<leader>t",
		open_cwd = "<leader>.",
	},
	split_navigation = {
		left = "<C-h>",
		down = "<C-j>",
		up = "<C-k>",
		right = "<C-l>",
	},
	iswap = "<leader>s",
	lsp = {
		code_action = "<leader>a",
		signature_help = "<C-o>",
		rename = "<leader>r",
		format = "<leader>f",
		goto_definition = "gd",
		goto_declaration = "gD",
		goto_implementations = "gI",
		goto_type = "gy",
		goto_references = "gr",
		next_reference = "]r",
		prev_reference = "[r",
	},
	diagnostic = {
		open_float = "<leader>d",
		show_list = "<leader>l",
	},
	surround = {
		add = "ma",
		delete = "md",
		find = "mf",
		find_left = "mF",
		highlight = "mh",
		replace = "mr",
	},
	git = {
		next_hunk = "]h",
		prev_hunk = "[h",
		stage_hunk = "<leader>hs",
		reset_hunk = "<leader>hr",
		undo_stage_hunk = "<leader>hu",
		preview_hunk = "<leader>hp",
		blame_line = "<leader>gb",
		reset_buffer = "<leader>gR",
		stage_buffer = "<leader>gS",
		diff = "<leader>hd",
		status = "<leader>gs",
		coauthors = "<leader>ga",
		show_commits = "<leader>gc",
	},
	snippets = {
		expand_or_jump = "<c-l>",
		jump_prev = "<c-h>",
	},
	completion = {
		scroll_docs_down = "<C-d>",
		scroll_docs_up = "<C-u>",
		complete = "<C-Space>",
		next = "<C-n>",
		previous = "<C-p>",
		abort = "<C-c>",
		confirm = "<C-y>",
		copilot = {
			next = "<C-j>",
			previous = "<C-k>",
		},
	},
}

return keys
