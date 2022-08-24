vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup {
  custom_highlights = {
    MatchParen = { fg = "#FE640B", bg = "#000000" },
  },
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin"
  }
}

vim.api.nvim_create_autocmd("User", {
  pattern = "PackerCompileDone",
  callback = function()
    print('122')
    vim.cmd "CatppuccinCompile"
    vim.defer_fn(function()
      vim.cmd "colorscheme catppuccin"
    end, 0) -- Defered for live reloading
  end
})

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
