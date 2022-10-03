local telescope = require("telescope")
local strings = require "plenary.strings"
local entry_display = require "telescope.pickers.entry_display"

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
			specific_opts = {
				["codeaction"] = {
					make_indexed = function(items)
						local indexed_items = {}
						local sorted_items = {}
						local null_ls_items = {}
						for _, item in ipairs(items) do
							local client = vim.lsp.get_client_by_id(item[1])
							if client.name == "null-ls" then
								table.insert(null_ls_items, item)
							else
								table.insert(sorted_items, item)
							end
						end
						vim.list_extend(sorted_items, null_ls_items)
						local widths = {
							idx = 0,
							command_title = 0,
							client_name = 0,
						}
						for idx, item in ipairs(sorted_items) do
							local client = vim.lsp.get_client_by_id(item[1])
							local entry = {
								idx = idx,
								["add"] = {
									command_title = item[2].title:gsub("\r\n", "\\r\\n"):gsub("\n", "\\n"),
									client_name = client and client.name or "",
								},
								text = item,
							}
							table.insert(indexed_items, entry)
							widths.idx = math.max(widths.idx, strings.strdisplaywidth(entry.idx))
							widths.command_title = math.max(widths.command_title, strings.strdisplaywidth(entry.add.command_title))
							widths.client_name = math.max(widths.client_name, strings.strdisplaywidth(entry.add.client_name))
						end
						return indexed_items, widths
					end,
					make_displayer = function(widths)
						return entry_display.create {
							separator = " ",
							items = {
								{ width = widths.idx + 1 }, -- +1 for ":" suffix
								{ width = widths.command_title },
								{ width = widths.client_name },
							},
						}
					end,
					make_display = function(displayer)
						return function(e)
							return displayer {
								{ e.value.idx .. ":", "TelescopePromptPrefix" },
								{ e.value.add.command_title },
								{ e.value.add.client_name, "TelescopeResultsComment" },
							}
						end
					end,
					make_ordinal = function(e)
						return e.idx .. e.add["command_title"]
					end,
				},
			}
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
