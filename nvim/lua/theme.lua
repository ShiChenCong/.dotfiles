vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]
vim.cmd [[
  hi DiffAdd ctermbg=4 guibg=#283b4D guifg=NONE
  hi DiffDelete ctermfg=12 ctermbg=6 guibg=#3F2D3D  guifg=NONE
  hi DiffChange ctermbg=5 guibg=#272D43 guifg=NONE
  hi DiffText cterm=bold ctermbg=9 guibg=#394b70 guifg=NONE
  hi Folded guibg=#3f4a57
  hi Search guibg=#3f4a57 guifg=NONE
  hi IncSearch guibg=#3f4a57 guifg=NONE
]]
