local options = {
  ["rust_analyzer"] = {
    tools = {
      inlay_hints = {
        auto = false,
      },
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            features = "all",
          },
          assist = {
            importEnforceGranularity = true,
          },
          checkOnSave = {
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
        }
      }
    }
  }
}

return options
