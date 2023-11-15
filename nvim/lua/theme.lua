-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup {
  catppuccin_flavour = 'macchiato',
  -- custom_highlights = {
  -- MatchParen = { fg = "#FE640B", bg = "#1c1a1a" },
  -- },
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin"
  },
  integrations = {
    neotree = true
  }
  -- transparent_background = true
}

vim.cmd.colorscheme "catppuccin-macchiato"
-- vim.cmd [[
--   hi Search guibg=#3f4a57 guifg=NONE
--   hi IncSearch guibg=#3f4a57 guifg=NONE
-- ]]
