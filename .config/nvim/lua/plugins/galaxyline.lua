local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'packer'}

-- utils --

local colors = {
  bg = '#181818',
  yellow = '#F7CA88',
  dark_yellow = '#D7BA7D',
  cyan = '#86C1B9',
  green = '#A1B56C',
  light_green = '#B5CEA8',
  string_orange = '#DC9656',
  orange = '#FF8800',
  purple = '#C586C0',
  magenta = '#BA8BAF',
  dark_grey = '#282828',
  grey = '#383838',
  light_grey = '#E8E8E8',
  blue = '#7CAFC2',
  vivid_blue = '#4FC1FF',
  light_blue = '#9CDCFE',
  red = '#AB4642',
  error_red = '#F44747'
}

local get_mode_color = function()
  local mode_color = {
    n = colors.red,
    i = colors.green,
    v = colors.blue,
    [''] = colors.blue,
    V = colors.blue,
    c = colors.magenta,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.red,
    t = colors.red
  }
  return mode_color[vim.fn.mode()]
end

local function file_readonly()
  if vim.bo.filetype == 'help' then return '' end
  local icon = ''
  if vim.bo.readonly == true then return " " .. icon .. " " end
  return ''
end

local function get_current_file_name()
  local file = vim.fn.expand('%:~:.')
  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
  local icon = ''
  if vim.bo.modifiable then
    if vim.bo.modified then return file .. ' ' .. icon .. '  ' end
  end
  return file .. ' '
end

local get_lsp_client = function(msg)
  msg = msg or 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return msg end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

-- left --

table.insert(gls.left, {
  ViMode = {
    provider = function()
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. get_mode_color())
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        v = 'VISUAL',
        V = 'VISUAL LINE',
        s = 'SELECT',
        [''] = 'VISUAL BLOCK'
      }
      return '  ' .. (alias[vim.fn.mode()] or vim.fn.mode()) .. ' '
    end,
    highlight = {colors.bg, colors.red, 'bold'}
  }
})

table.insert(gls.left, {
  ViModeSeparator = {
    provider = function()
      vim.api
          .nvim_command('hi GalaxyViModeSeparator guifg=' .. get_mode_color())
      return ''
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.grey},
    highlight = {colors.red, colors.grey}
  }
})

table.insert(gls.left, {
  GitBranch = {
    provider = 'GitBranch',
    icon = ' ',
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {colors.bg, colors.grey},
    highlight = {colors.green, colors.grey}
  }
})

table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green, colors.grey}
  }
})
table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.blue, colors.grey}
  }
})
table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red, colors.grey}
  }
})

table.insert(gls.left, {
  GreySeparator = {
    provider = function() return ' ' end,
    highlight = {colors.grey, colors.dark_grey}
  }
})

table.insert(gls.left, {
  FileName = {
    provider = function() return get_current_file_name() end,
    highlight = 'StatusLine'
  }
})

-- right --

table.insert(gls.right, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.error_red, colors.dark_grey}
  }
})

table.insert(gls.right, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange, colors.dark_grey}
  }
})

table.insert(gls.right, {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.blue, colors.dark_grey}
  }
})

table.insert(gls.right, {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue, colors.dark_grey}
  }
})

table.insert(gls.right, {
  LspInfo = {
    icon = ' ',
    provider = function()
      local status = require('lsp-status').status()
      if status == ' ' then return get_lsp_client() end
      return status
    end,
    highlight = 'StatusLine'
  }
})

-- short status line
table.insert(gls.short_line_left, {
  Padding = {
    provider = function() return ' ' end,
    highlight = {colors.green, colors.grey}
  }
})
table.insert(gls.short_line_left, {DiffAdd = {}})
table.insert(gls.short_line_left, {DiffModified = {}})
table.insert(gls.short_line_left, {DiffRemove = {}})
table.insert(gls.short_line_left, {GreySeparator = {}})
table.insert(gls.short_line_left, {FileName = {}})

