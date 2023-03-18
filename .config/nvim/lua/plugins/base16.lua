local function get_color(group, attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

return {
  {
    "RRethy/nvim-base16",
    init = function()
      local base16 = require("base16-colorscheme")
      vim.cmd.colorscheme("base16-default-dark")
    	vim.api.nvim_set_hl(0, "StatusLine", { bg = base16.colors.base01 })
    	vim.api.nvim_set_hl(0, "LineNr", { bg = base16.colors.base01 })
    	vim.api.nvim_set_hl(0, "SignColumn", { bg = base16.colors.base01 })
    	vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = get_color("SignColumn", "bg"), fg = get_color("DiagnosticError", "fg") })
    	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = get_color("SignColumn", "bg"), fg = get_color("DiagnosticWarn", "fg") })
    	vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = get_color("SignColumn", "bg"), fg = get_color("DiagnosticHint", "fg") })
    	vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = get_color("SignColumn", "bg"), fg = get_color("DiagnosticInfo", "fg") })
    	vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = get_color("SignColumn", "bg"), fg = get_color("GitGutterAdd", "fg") })
    	vim.api.nvim_set_hl(0, "GitGutterChange", { bg = get_color("SignColumn", "bg"), fg = get_color("GitGutterChange", "fg") })
    	vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = get_color("SignColumn", "bg"), fg = get_color("GitGutterDelete", "fg") })
    	vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { bg = get_color("SignColumn", "bg"), fg = get_color("GitGutterChangeDelete", "fg") })
    end
  }
}
