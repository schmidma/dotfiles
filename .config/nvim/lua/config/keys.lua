local M = {
	leader = " ",
	localleader = "\\",
	write = "<leader>w",
	close_window = "<leader>q",
	clear_search_highlight = ";",
	movement = {
		start_of_line = "g0",
		start_non_whitespace_of_line = "gh",
		end_of_line = "gl",
		matching_item = "mm",
	},
	clipboard = {
		yank = "<leader>y",
		yank_line = "<leader>Y",
		paste = "<leader>p",
		paste_before = "<leader>P",
	},
	files = {
		current = "<leader>t",
		cwd = "<leader>T",
	},
	split_navigation = {
		left = { "<C-h>", "<C-Left>" },
		down = { "<C-j>", "<C-Down>" },
		up = { "<C-k>", "<C-Up>" },
		right = { "<C-l>", "<C-Right>" },
	},
	buffer = {
		prev = "[b",
		next = "]b",
		pick = "<leader>bp",
		delete = "<leader>bd",
		force_delete = "<leader>bD",
	},
	find = {
		files = { "<leader>ff", "<leader>e" },
		buffers = "<leader>fb",
		grep = { "<leader>fg", "<leader>/" },
		help = "<leader>fh",
		resume = "<leader>fr",
		commands = "<leader>fc",
		keymaps = "<leader>fk",
	},
	git = {
		commits = "<leader>gc",
		status = "<leader>gs",
		next_hunk = "]h",
		prev_hunk = "[h",
		stage_hunk = "<leader>ghs",
		reset_hunk = "<leader>ghr",
		stage_buffer = "<leader>ghb",
		undo_stage_hunk = "<leader>ghu",
		reset_buffer = "<leader>ghR",
		preview_hunk = "<leader>ghp",
		blame_line = "<leader>gbl",
		diff = "<leader>ghd",
	},
	diagnostics = {
		line = "<leader>dd",
		buffer = "<leader>db",
		workspace = "<leader>dw",
	},
	ui = {
		autoformat_buffer = "<leader>uf",
		autoformat_global = "<leader>uF",
		diagnostics = "<leader>ud",
		whitespace = "<leader>ug",
		inlay_hints = "<leader>uh",
		line_numbers = "<leader>ul",
		relative_numbers = "<leader>uL",
		spell = "<leader>us",
		wrap = "<leader>uw",
	},
	lsp = {
		code_action = { "<leader>a", "gra" },
		declaration = "gD",
		definition = "gd",
		document_symbol = "gO",
		format = "<leader>cf",
		hover = "K",
		implementation = "gri",
		references = "grr",
		rename = "grn",
		signature_help = "<C-s>",
		type_definition = { "grt" },
		workspace_symbol = "grS",
		next_reference = "]r",
		prev_reference = "[r",
	},
	flash = {
		jump = "s",
	},
	-- quickfix = {
	-- 	toggle = "<leader>xx",
	-- 	loclist = "<leader>xl",
	-- },
	venv = {
		select = "<leader>vs",
	},
	completion = {
		copilot_next = "<C-j>",
		copilot_prev = "<C-k>",
		copilot_accept = "<C-y>",
	},
	surround = {
		add = "ma",
		delete = "md",
		find = "mf",
		find_left = "mF",
		highlight = "mh",
		replace = "mr",
	},
}

function M.map(mode, lhs, rhs, opts)
	local lhs_list = type(lhs) == "string" and { lhs } or lhs
	for _, key in ipairs(lhs_list) do
		vim.keymap.set(mode, key, rhs, opts)
	end
end

return M
