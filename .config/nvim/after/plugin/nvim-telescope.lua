local telescope = require("telescope")
telescope.setup({
	pickers = {
		lsp_definitions = {
			theme = "dropdown",
			initial_mode = "normal",
		},
		lsp_references = {
			theme = "dropdown",
			initial_mode = "normal",
		},
		find_files = {
			previewer = false,
		},
		grep_string = {
			only_sort_text = true,
			search = '',
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		["ui-select"] = {
			require("telescope.themes").get_cursor({ initial_mode = "normal" }),
		},
	},
})

-- extensions
telescope.load_extension("githubcoauthors")
telescope.load_extension("ui-select")

-- mappings
local nmap = require("keymap").nmap

local builtin = require("telescope.builtin")

nmap("gd", builtin.lsp_definitions)
nmap("gt", builtin.lsp_type_definitions)
nmap("gr", builtin.lsp_references)
nmap("<leader>e", builtin.find_files)
nmap("<leader>/", builtin.current_buffer_fuzzy_find)
nmap("<leader>rg", builtin.grep_string)
nmap("<leader>gb", builtin.git_branches)
nmap("<leader>gs", builtin.git_status)
nmap("<leader>ga", telescope.extensions.githubcoauthors.coauthors)

-- telescope-dap
nmap("<leader>dcc", telescope.extensions.dap.commands)
nmap("<leader>dco", telescope.extensions.dap.configurations)
nmap("<leader>dlb", telescope.extensions.dap.list_breakpoints)
nmap("<leader>dv", telescope.extensions.dap.variables)
nmap("<leader>df", telescope.extensions.dap.frames)
