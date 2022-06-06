local types = require('onedark.types')
local Styles = types.od.HighlightStyle

require('onedark').setup({
  -- transparent = true,
  -- transparent_sidebar = true,
  overrides = function(c)
    return {
      LspDiagnosticsVirtualTextHint = { style = Styles.Undercurl },
      MatchParen = { fg = c.orange1, style = Styles.Bold },
      NormalFloat = { bg = c.bg_visual }
    }
  end
})

vim.cmd [[
  hi Folded guibg=#2c313a
  hi NvimTreeVertSplit guibg=#282c34 guifg=#282c34
]]

-- local catppuccin = require("catppuccin")
-- catppuccin.setup({
--   integrations = {
--     bufferline = false,
--     nvimtree = {
--       enabled = true,
--       show_root = false,
--       transparent_panel = false,
--     },
--     gitsigns = true,
--     telescope = true,
--     cmp = true,
--     treesitter = true,
--     native_lsp = {
--       enabled = true,
--       virtual_text = {
--         errors = "italic",
--         hints = "italic",
--         warnings = "italic",
--         information = "italic",
--       },
--       underlines = {
--         errors = "underline",
--         hints = "underline",
--         warnings = "underline",
--         information = "underline",
--       },
--       hop = true
--     },
--     lsp_trouble = false,
--   }
-- })
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- vim.cmd [[colorscheme catppuccin]]
