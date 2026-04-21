local M = {}

function M.is_enabled(bufnr)
	local is_global_enabled = vim.g.disable_autoformat ~= true
	if bufnr == nil then
		return is_global_enabled
	end

	local is_buffer_enabled = vim.b[bufnr].disable_autoformat ~= true
	return is_global_enabled and is_buffer_enabled
end

function M.set_enabled(enabled, bufnr)
	if bufnr == nil then
		vim.g.disable_autoformat = not enabled
		return
	end

	vim.b[bufnr].disable_autoformat = not enabled
end

function M.toggle(bufnr)
	local enabled = M.is_enabled(bufnr)
	M.set_enabled(not enabled, bufnr)
	return not enabled
end

return M
