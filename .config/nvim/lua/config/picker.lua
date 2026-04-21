local keys = require("config.keys")

-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = vim.api.nvim_create_augroup("config_picker", { clear = true }),
-- 	pattern = { "snacks_picker_list", "snacks_picker_preview", "snacks_picker_input" },
-- 	callback = function(args)
-- 		vim.schedule(function()
-- 			if not vim.api.nvim_buf_is_valid(args.buf) then
-- 				return
-- 			end
-- 			for _, win in ipairs(vim.fn.win_findbuf(args.buf)) do
-- 				local cur = vim.wo[win].winhighlight
-- 				if cur ~= "" and not cur:find("NormalNC:", 1, true) then
-- 					vim.wo[win].winhighlight = cur .. ",NormalNC:Normal"
-- 				end
-- 			end
-- 		end)
-- 	end,
-- })

keys.map("n", keys.find.files, function()
	Snacks.picker.files()
end, { desc = "Find files" })
keys.map("n", keys.find.buffers, function()
	Snacks.picker.buffers()
end, { desc = "Find buffers" })
keys.map("n", keys.find.grep, function()
	Snacks.picker.grep()
end, { desc = "Live grep" })
keys.map("n", keys.find.help, function()
	Snacks.picker.help()
end, { desc = "Find help tags" })
keys.map("n", keys.find.resume, function()
	Snacks.picker.resume()
end, { desc = "Resume last search" })
keys.map("n", keys.find.commands, function()
	Snacks.picker.commands()
end, { desc = "Find commands" })
keys.map("n", keys.find.keymaps, function()
	Snacks.picker.keymaps()
end, { desc = "Find keymaps" })

keys.map("n", keys.git.commits, function()
	Snacks.picker.git_log()
end, { desc = "Git commits" })
keys.map("n", keys.git.status, function()
	Snacks.picker.git_status()
end, { desc = "Git status" })

keys.map("n", keys.diagnostics.buffer, function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer diagnostics" })
keys.map("n", keys.diagnostics.workspace, function()
	Snacks.picker.diagnostics()
end, { desc = "Workspace diagnostics" })
