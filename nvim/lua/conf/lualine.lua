local status, lualine = pcall(require, "lualine")
if (not status) then return end
-- local onedark = require 'lualine.themes.onedark'
local cp = require("catppuccin.core.palettes.init").get_palette()
local catppuccin = {}

catppuccin.normal = {
  a = { bg = cp.blue, fg = cp.mantle, gui = "bold" },
  b = { bg = cp.surface1, fg = cp.blue },
  c = { bg = cp.mantle, fg = cp.text },
}

catppuccin.insert = {
  a = { bg = cp.green, fg = cp.base, gui = "bold" },
  b = { bg = cp.surface1, fg = cp.teal },
}

catppuccin.command = {
  a = { bg = cp.yellow, fg = cp.base, gui = "bold" },
  b = { bg = cp.surface1, fg = cp.yellow },
}
-- catppuccin.command = {
--   a = { bg = cp.blue, fg = cp.mantle, gui = "bold" },
--   b = { bg = cp.surface1, fg = cp.blue },
--   c = { bg = cp.mantle, fg = cp.text }
-- }

catppuccin.visual = {
  a = { bg = cp.mauve, fg = cp.base, gui = "bold" },
  b = { bg = cp.surface1, fg = cp.mauve },
}

catppuccin.replace = {
  a = { bg = cp.red, fg = cp.base, gui = "bold" },
  b = { bg = cp.surface1, fg = cp.red },
}

catppuccin.inactive = {
  a = { bg = cp.mantle, fg = cp.blue },
  b = { bg = cp.mantle, fg = cp.surface1, gui = "bold" },
  c = { bg = cp.mantle, fg = cp.overlay0 },
}
lualine.setup {
  options = {
    icons_enabled = true,
    theme = catppuccin,
    globalstatus = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
    },
    lualine_x = {
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
  },
  tabline = {},
  extensions = { 'fugitive', 'fzf', 'nvim-tree', 'quickfix', 'toggleterm' }
}
