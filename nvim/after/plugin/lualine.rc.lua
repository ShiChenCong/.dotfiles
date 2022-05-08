local status, lualine = pcall(require, "lualine")
if (not status) then return end
local onedark = require'lualine.themes.onedark'
lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = onedark,
    theme = 'onenord',
    -- theme = 'gruvbox',
    -- theme = 'codedark',
    -- theme = 'onedark-nvim',
    globalstatus = true,
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
  },
  tabline = {},
  extensions = {'fugitive', 'fzf', 'nvim-tree', 'quickfix'}
}

