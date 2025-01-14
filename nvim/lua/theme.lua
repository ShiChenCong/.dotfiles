-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup {
  -- catppuccin_flavour = 'macchiato',
  -- custom_highlights = {
  -- MatchParen = { fg = "#FE640B", bg = "#1c1a1a" },
  -- },
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin"
  },
  integrations = {
    blink_cmp = true
  }
  -- transparent_background = true
}

vim.cmd.colorscheme "catppuccin"
