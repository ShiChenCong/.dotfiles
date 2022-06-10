require('scrollview').setup {
  -- auto_mouse = false,
  column = 1,
  -- winblend = 75,
  excluded_filetypes = { 'NvimTree' },
}

vim.cmd [[
  highlight ScrollView ctermbg=159 guibg=LightCyan
]]
