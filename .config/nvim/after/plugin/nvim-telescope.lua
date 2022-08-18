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
		diagnostics = {
			initial_mode = "normal"
		}
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
local keys = require("keymap").keys

local builtin = require("telescope.builtin")

nmap(keys.lsp.goto_definition, builtin.lsp_definitions)
nmap(keys.lsp.goto_type, builtin.lsp_type_definitions)
nmap(keys.lsp.goto_references, builtin.lsp_references)
nmap(keys.diagnostic.show_list, builtin.diagnostics)
nmap(keys.open_file_selection, builtin.find_files)
nmap(keys.grep_string, builtin.grep_string)
nmap(keys.git.branches, builtin.git_branches)
nmap(keys.git.status, builtin.git_status)
nmap(keys.git.coauthors, telescope.extensions.githubcoauthors.coauthors)
