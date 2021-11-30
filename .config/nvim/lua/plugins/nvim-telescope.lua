require('telescope').setup {
  pickers = {
    lsp_code_actions = {
      theme = "cursor",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    find_files = {
      previewer = false,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}
