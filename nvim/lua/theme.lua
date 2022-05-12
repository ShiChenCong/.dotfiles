local types = require('onedark.types')
local Styles = types.od.HighlightStyle

require('onedark').setup({
  overrides = function(c)
    return {
      LspDiagnosticsVirtualTextHint = { style = Styles.Undercurl },
    }
  end
})
