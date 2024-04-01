local options = {
  ["rust_analyzer"] = {
    tools = {
      inlay_hints = {
        auto = true,
      },
    },
    server = {
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            features = "all",
          },
          imports = {
            granularity = {
              enforce = true,
            },
          },
          check = {
            command = "clippy",
          },
        },
      },
    },
  },
  ["lua_ls"] = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  ["texlab"] = {
    settings = {
      texlab = {
        auxDirectory = "output",
        chktex = {
          onEdit = true,
          onOpenAndSave = true,
        },
      },
    },
  },
  ["ruff_lsp"] = {
    on_attach = function(client, bufnr)
      client.server_capabilities.hoverProvider = false
    end,
  },
  ["pyright"] = {
    capabilities = (function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
      return capabilities
    end)(),
    settings = {
      python = {
        analysis = {},
      },
    },
  },
  ["julials"] = {
    settings = {
      julia = {
        lint = {
          call = false,
        },
      },
    },
  },
  ["typst_lsp"] = {
    settings = {
      exportPdf = "never",
    },
  },
  ["ltex"] = {
    on_attach = function(client, bufnr)
      require("ltex-utils").on_attach(bufnr)
    end,
  },
}

return options
