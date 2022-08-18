local wezterm = require('wezterm')
local config = {
  font_size = 18,
  line_height = 1.2,
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = 'Whimsy',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
}

return config
