local function telescope(command, opts)
	return function()
		require("telescope.builtin")[command](opts)
	end
end

local keys = require("keys")

return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				keys.resume_selection,
				telescope("resume"),
				desc = "Resume",
			},
			{
				keys.open_file_selection,
				telescope("find_files", { hidden = true }),
				desc = "Find Files",
			},
			{
				keys.show_buffers,
				telescope("buffers", { show_all_buffers = true }),
				desc = "Switch Buffer",
			},
			{
				keys.live_grep,
				telescope("live_grep"),
				desc = "Live Grep",
			},
			{
				keys.command_history,
				telescope("command_history"),
				desc = "Command History",
			},
			{
				keys.git.show_commits,
				telescope("git_commits"),
				desc = "Show Git Commits",
			},
			{
				keys.git.status,
				telescope("git_status"),
				desc = "Show Git Status",
			},
			{
				keys.diagnostic.show_list,
				telescope("diagnostics", { previewer = false }),
				desc = "Show Diagnostics",
			},
			{
				keys.show_keymaps,
				telescope("keymaps"),
				desc = "Show Keymaps",
			},
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<esc>"] = function(...)
							return require("telescope.actions").close(...)
						end,
					},
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzy_native")
		end,
	},
	{
		"2kabhishek/co-author.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = { "CoAuthor" },
		keys = {
			{
				keys.git.coauthors,
				function()
					require("co-author").list()
				end,
				desc = "Open List of possible Co-Authors",
			},
		},
	},
}
