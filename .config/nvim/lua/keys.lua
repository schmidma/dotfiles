local keys = {
	leader = " ",
	write = "<leader>w",
	movement = {
		start_of_line = "gh",
		end_of_line = "gl",
	},
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
	conflict = {
		next = "]x",
		previous = "[x",
	},
	resume_selection = "<leader><tab>",
	open_file_selection = "<leader>e",
	show_buffers = "<leader>,",
	live_grep = "<leader>/",
	command_history = "<leader>:",
	show_keymaps = "<leader>?",
	toggle_file_tree = "<leader>nt",
	pick_symbols = "<leader>ss",
	split_navigation = {
		left = "<C-h>",
		down = "<C-j>",
		up = "<C-k>",
		right = "<C-l>",
	},
	iswap = "gs",
	lsp = {
		code_action = "<leader>a",
		hover = "K",
		signature_help = "<c-k>",
		rename = "<leader>r",
		format = "<leader>f",
		toggle_autoformat = "<leader>uf",
		goto_definition = "gd",
		goto_declaration = "gD",
		goto_implementations = "gI",
		goto_type = "gy",
		goto_references = "gr",
		next_reference = "]r",
		prev_reference = "[r",
	},
	diagnostic = {
		goto_prev = "[d",
		goto_next = "]d",
		open_float = "<leader>d",
		show_list = "<leader>l",
	},
	surround = {
		add = "ma",
		delete = "md",
		find = "mm",
		find_left = "mM",
		highlight = "mh",
		replace = "mr",
	},
	comment = {
		comment = "gc",
		comment_line = "gcc",
		text_object = "gc",
	},
	git = {
		next_hunk = "]h",
		prev_hunk = "[h",
		stage_hunk = "<leader>hs",
		reset_hunk = "<leader>hr",
		stage_buffer = "<leader>hS",
		undo_stage_hunk = "<leader>hu",
		reset_buffer = "<leader>hR",
		preview_hunk = "<leader>hp",
		blame_line = "<leader>hb",
		diff = "<leader>hd",
		branches = "<leader>gb",
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
		trigger = "<C-Space>",
		next = "<C-n>",
		prev = "<C-p>",
		close = "<C-e>",
		confirm = "<C-y>",
	},
}

return keys
