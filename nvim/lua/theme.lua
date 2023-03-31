-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup {
    custom_highlights = {
        MatchParen = { fg = "#FE640B", bg = "#1c1a1a" },
    },
    compile = {
        enabled = true,
        path = vim.fn.stdpath "cache" .. "/catppuccin"
    }
}

vim.cmd [[colorscheme catppuccin-macchiato]]
vim.cmd [[
  hi DiffAdd ctermbg=4 guibg=#283b4D guifg=NONE
  hi DiffDelete ctermfg=12 ctermbg=6 guibg=#3F2D3D  guifg=NONE
  hi DiffChange ctermbg=5 guibg=#272D43 guifg=NONE
  hi DiffText cterm=bold ctermbg=9 guibg=#394b70 guifg=NONE
  hi Folded guibg=NONE guifg=NONE
  hi Search guibg=#3f4a57 guifg=NONE
  hi IncSearch guibg=#3f4a57 guifg=NONE
]]
