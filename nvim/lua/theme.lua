-- local types = require('onedark.types')
-- local Styles = types.od.HighlightStyle
--
-- require('onedark').setup({
--   -- transparent = true,
--   -- transparent_sidebar = true,
--   overrides = function(c)
--     return {
--       LspDiagnosticsVirtualTextHint = { style = Styles.Undercurl },
--     }
--   end
-- })
--
-- vim.cmd [[
-- hi Folded guibg=#2c313a
-- hi NvimTreeVertSplit guibg=#282c34 guifg=#282c34
-- ]]

local catppuccin = require("catppuccin")
catppuccin.setup({
  integrations = {
    bufferline = false,
    nvimtree = {
      enabled = true,
      show_root = false,
      transparent_panel = false,
    },
  }
})
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]
