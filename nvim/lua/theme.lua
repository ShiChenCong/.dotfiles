-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup {
  -- catppuccin_flavour = 'macchiato',
  custom_highlights = function(colors)
    return {
      BlinkCmpMenu = {
        bg = colors.mantle
      },
      BlinkCmpMenuBorder = {
        bg = colors.mantle
      },
      BlinkCmpDocBorder = {
        bg = colors.mantle
      }
    }
  end,
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
