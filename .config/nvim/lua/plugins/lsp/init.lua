local function register_lsp_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

local custom_server_setup = {
  ["rust_analyzer"] = function(opts)
    require("rust-tools").setup(opts)
  end,
}

local function setup_borders(opts)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = opts.float.border })
  vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = opts.float.border })
  require("lspconfig.ui.windows").default_options = { border = opts.float.border }
  vim.diagnostic.config(opts)
end

local function setup_diagnostic_signs()
  for name, icon in pairs(require("icons").diagnostics) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    if venv ~= "" then
      require("venv-selector").retrieve_from_cache()
    end
  end,
  once = true,
})

return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "fidget.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "simrat39/rust-tools.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
        float = { border = "rounded" },
      },
      manual_register = { "rust_analyzer" },
    },
    config = function(_, opts)
      register_lsp_attach(function(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)
      setup_diagnostic_signs()
      setup_borders(opts.diagnostics)

      local capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local function setup_lsp_server(server)
        local server_options = require("plugins.lsp.server_options")[server] or {}
        local options = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, server_options)
        if custom_server_setup[server] then
          custom_server_setup[server](options)
        else
          require("lspconfig")[server].setup(options)
        end
      end
      require("mason-lspconfig").setup_handlers({ setup_lsp_server })

      for _, server in ipairs(opts.manual_register) do
        setup_lsp_server(server)
      end
    end,
  },
  {
    "j-hui/fidget.nvim",
    lazy = true,
    opts = {},
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim"
    },
    opts = {
      name = { "venv", ".venv" },
    },
  },
  {
    "github/copilot.vim",
  },
}
