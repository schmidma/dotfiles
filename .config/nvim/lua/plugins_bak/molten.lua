local keys = require("keys")

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

return {
	{
		"benlubas/molten-nvim",
		dependencies = { "3rd/image.nvim" },
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		build = ":UpdateRemotePlugins",
		lazy = false,
		keys = {
			{
				keys.molten.init,
				":MoltenInit<CR>",
				desc = "Initialize Molten.nvim",
			},
			{
				keys.molten.evaluate,
				":MoltenEvaluateOperator<CR>",
				desc = "Molten: Evaluate",
			},
			{
				keys.molten.evaluate_line,
				":MoltenEvaluateLine<CR>",
				desc = "Molten: Evaluate Line",
			},
			{
				keys.molten.reevaluate_cell,
				":MoltenReevaluateCell<CR>",
				desc = "Molten: Evaluate Cell",
			},
			{
				keys.molten.evaluate_visual,
				":<C-u>MoltenEvaluateVisual<CR>",
				desc = "Molten: Evaluate Visual Selection",
				mode = { "v" },
			},
			{
				keys.molten.delete_cell,
				":MoltenDelete<CR>",
				desc = "Molten: Delete Cell",
			},
			{
				keys.molten.hide_output,
				":MoltenHideOutput<CR>",
				desc = "Molten: Hide Output",
			},
			{
				keys.molten.show_output,
				":noautocmd MoltenEnterOutput<CR>",
				desc = "Molten: Show/Enter Output",
			},
			{
				keys.molten.open_in_browser,
				":MoltenOpenInBrowser<CR>",
				desc = "Molten: Open in Browser",
			},
		},
		init = function()
			vim.g.molten_virt_text_output = true
			vim.g.molten_cover_empty_lines = true
			vim.g.molten_auto_open_output = false
			-- vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_lines_off_by_1 = true
			-- vim.g.molten_output_win_max_height = 20
		end,
	},
	-- {
	-- 	"3rd/image.nvim",
	-- 	config = function()
	-- 		require("image").setup({
	-- 			-- backend = "ueberzug",
	-- 			integrations = {
	-- 				-- markdown = {
	-- 				-- 	resolve_image_path = function(document_path, image_path, fallback)
	-- 				-- 		-- document_path is the path to the file that contains the image
	-- 				-- 		-- image_path is the potentially relative path to the image. for
	-- 				-- 		-- markdown it's `![](this text)`
	-- 				--
	-- 				-- 		-- you can call the fallback function to get the default behavior
	-- 				-- 		return fallback(document_path, image_path)
	-- 				-- 	end,
	-- 				-- },
	-- 			},
	-- 			max_width = 100, -- tweak to preference
	-- 			max_height = 12, -- ^
	-- 			max_height_window_percentage = math.huge, -- this is necessary for a good experience
	-- 			max_width_window_percentage = math.huge,
	-- 			window_overlap_clear_enabled = true,
	-- 			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"quarto-dev/quarto-nvim",
	-- 	dependencies = {
	-- 		"jmbuhr/otter.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			keys.quarto.run_cell,
	-- 			function()
	-- 				require("quarto.runner").run_cell()
	-- 			end,
	-- 			desc = "Quarto: Run Cell",
	-- 		},
	-- 		{
	-- 			keys.quarto.run_above,
	-- 			function()
	-- 				require("quarto.runner").run_above()
	-- 			end,
	-- 			desc = "Quarto: Run Above",
	-- 		},
	-- 		{
	-- 			keys.quarto.run_all,
	-- 			function()
	-- 				require("quarto.runner").run_all()
	-- 			end,
	-- 			desc = "Quarto: Run All",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		local quarto = require("quarto")
	-- 		quarto.setup({
	-- 			lspFeatures = {
	-- 				-- NOTE: put whatever languages you want here:
	-- 				languages = { "r", "python", "julia", "rust" },
	-- 				chunks = "all",
	-- 				diagnostics = {
	-- 					enabled = true,
	-- 					triggers = { "BufWritePost" },
	-- 				},
	-- 				completion = {
	-- 					enabled = true,
	-- 				},
	-- 			},
	-- 			-- keymap = {
	-- 			-- 	hover = "H",
	-- 			-- 	definition = "gd",
	-- 			-- 	rename = "<leader>rn",
	-- 			-- 	references = "gr",
	-- 			-- 	format = "<leader>gf",
	-- 			-- },
	-- 			codeRunner = {
	-- 				enabled = true,
	-- 				default_method = "molten",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"GCBallesteros/jupytext.nvim",
	-- 	config = function()
	-- 		require("jupytext").setup({
	-- 			style = "markdown",
	-- 			output_extension = "md",
	-- 			force_ft = "markdown",
	-- 		})
	-- 	end,
	-- },
}
