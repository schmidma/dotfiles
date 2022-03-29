local dap = require("dap")
local variables = require("dap.ui.variables")
local widgets = require("dap.ui.widgets")
local dapui = require("dapui")

-- mappings
local nmap = require("keymap").nmap
nmap("<leader>dct", dap.continue)
nmap("<leader>dsv", dap.step_over)
nmap("<leader>dsi", dap.step_into)
nmap("<leader>dso", dap.step_out)
nmap("<leader>dtb", dap.toggle_breakpoint)

nmap("<leader>dsc", variables.scopes)
nmap("<leader>dhh", variables.hover)
nmap("<leader>dhv", variables.visual_hover)

nmap("<leader>duh", widgets.hover)
nmap("<leader>duf", function()
	widgets.centered_float(widgets.scopes)
end)

nmap("<leader>dsbr", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
nmap("<leader>dsbm", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
nmap("<leader>dro", dap.repl.open)
nmap("<leader>drl", dap.repl.run_last)

-- nvim-dap-ui
nmap("<leader>dui", dapui.toggle)
