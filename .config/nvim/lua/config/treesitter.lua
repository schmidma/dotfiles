local group = vim.api.nvim_create_augroup("config_treesitter", { clear = true })
local ts_config = require("nvim-treesitter.config")

require("nvim-treesitter").install({
	"lua",
	"vim",
	"vimdoc",
	"query",
	"rust",
	"python",
	"markdown",
	"markdown_inline",
	"latex",
	"bibtex",
})

local function ensure(lang, bufnr)
	if vim.tbl_contains(ts_config.get_installed("parsers"), lang) then
		pcall(vim.treesitter.start, bufnr, lang)
		return
	end
	if not vim.tbl_contains(ts_config.get_available(), lang) then
		return
	end
	require("nvim-treesitter").install({ lang }):await(function(err)
		if err then
			return
		end
		vim.schedule(function()
			if vim.api.nvim_buf_is_valid(bufnr) then
				pcall(vim.treesitter.start, bufnr, lang)
			end
		end)
	end)
end

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(ev)
		local ft = vim.bo[ev.buf].filetype
		local lang = vim.treesitter.language.get_lang(ft) or ft
		ensure(lang, ev.buf)
		vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
