local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.misspell,
    null_ls.builtins.diagnostics.commitlint,
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.proselint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.taplo,
    null_ls.builtins.formatting.yapf,
  },
})
