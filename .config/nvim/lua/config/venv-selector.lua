local keys = require("config.keys")

local function active_venv()
	local path = require("venv-selector").venv()
	if not path or path == "" then
		return ""
	end

	return "󰌠 " .. vim.fn.fnamemodify(path, ":t")
end

require("venv-selector").setup({
	options = {
		-- picker = "auto",
		statusline_func = {
			lualine = active_venv,
		},
	},
})

keys.map("n", keys.venv.select, vim.cmd.VenvSelect, { desc = "Select virtualenv" })
