local group = vim.api.nvim_create_augroup("config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = group,
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd.checktime()
		end
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	group = group,
	callback = function()
		vim.cmd.wincmd("=")
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "help", "man", "qf", "checkhealth" },
	callback = function(args)
		vim.bo[args.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = args.buf,
			silent = true,
			desc = "Close window",
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "cmd", "dialog", "msg", "pager" },
	callback = function(args)
		vim.bo[args.buf].buflisted = false
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.statuscolumn = ""
		vim.opt_local.wrap = args.match ~= "cmd"
		vim.opt_local.spell = false
		vim.opt_local.list = false
	end,
})
