local keys = require("config.keys")

require("mini.files").setup({
	options = {
		permanent_delete = false,
		use_as_default_explorer = false,
	},
	mappings = {
		close = "<Esc>",
		go_in_plus = "<CR>",
		go_in = "",
		go_out = "<BS>",
		reset = "g<BS>",
		synchronize = keys.write,
	},
	windows = {
		preview = true,
		width_focus = 30,
		width_nofocus = 20,
		width_preview = 30,
	},
})

keys.map("n", keys.files.current, function()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		path = vim.uv.cwd()
	end
	require("mini.files").open(path, false)
end, { desc = "Open file explorer" })
keys.map("n", keys.files.cwd, function()
	require("mini.files").open(nil, false)
end, { desc = "Open file explorer at cwd" })

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("config_mini_files_lsp_rename", { clear = true }),
	pattern = { "MiniFilesActionRename", "MiniFilesActionMove" },
	callback = function(ev)
		require("snacks").rename.on_rename_file(ev.data.from, ev.data.to)
	end,
})
