local types = require('onedark.types')
local Styles = types.od.HighlightStyle

require('onedark').setup({
  -- transparent = true,
  -- transparent_sidebar = true,
  overrides = function(c)
    return {
      LspDiagnosticsVirtualTextHint = { style = Styles.Undercurl },
    }
  end
})

vim.cmd [[hi Folded guibg=#2c313a]]
