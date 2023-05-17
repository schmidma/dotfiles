local keys = require("keys")

return {
	{
		"WhiteBlackGoose/magma-nvim",
		build = ":UpdateRemotePlugins",
		config = function()
			vim.keymap.set("n", keys.magma.evaluate_operator, function()
				vim.o.operatorfunc = "MagmaOperatorfunc"
				return "g@"
			end, { expr = true })
		end,
		keys = {
			{
				keys.magma.init,
				function()
					vim.cmd.MagmaInit()
				end,
				desc = "Initialize Magma",
			},
			{
				keys.magma.evaluate_line,
				function()
					vim.cmd.MagmaEvaluateLine()
				end,
				desc = "Evaluate Line",
			},
			{
				keys.magma.evaluate_visual,
				"<esc><cmd>MagmaEvaluateVisual<cr>",
				mode = "x",
				desc = "Evaluate Visual",
			},
			{
				keys.magma.enter_output,
				"<cmd>noautocmd MagmaEnterOutput<cr>",
				desc = "Enter Output",
			},
			{
				keys.magma.reevaluate_cell,
				function()
					vim.cmd.MagmaReevaluateCell()
				end,
				desc = "Revaluate Cell",
			},
			{
				keys.magma.delete,
				function()
					vim.cmd.MagmaDelete()
				end,
				desc = "Delete Output",
			},
		},
	},
}
