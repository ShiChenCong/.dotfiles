--local types = require('onedark.types')
--local Styles = types.od.HighlightStyle

-- require('onedark').setup({
--   -- transparent = true,
--   -- transparent_sidebar = true,
--   overrides = function(c)
--     return {
--       LspDiagnosticsVirtualTextHint = { style = Styles.Undercurl },
--       MatchParen = { fg = c.orange1, style = Styles.Bold, bg = c.bg_visual },
--       NormalFloat = { bg = c.bg_visual }
--     }
--   end
-- })
--
-- vim.cmd [[
--   hi Folded guibg=#2c313a
--   hi NvimTreeWinSeparator guifg=#282c34 guibg=#282c34
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
    gitsigns = true,
    telescope = true,
    cmp = true,
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
      hop = true
    },
    lsp_trouble = false,
  }
})
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]
vim.cmd [[
  hi DiffAdd ctermbg=4 guibg=#283b4D guifg=NONE
  hi DiffDelete ctermfg=12 ctermbg=6 guibg=#3F2D3D  guifg=NONE
  hi DiffChange ctermbg=5 guibg=#272D43 guifg=NONE
  hi DiffText cterm=bold ctermbg=9 guibg=#394b70 guifg=NONE
  hi Folded guibg=#2c313a
  hi Search guibg=#515C6A guifg=NONE
  hi IncSearch guibg=#515C6A guifg=NONE
]]
