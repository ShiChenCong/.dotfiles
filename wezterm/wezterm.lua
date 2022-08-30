local wezterm = require('wezterm')
local config = {
  font_size = 17.5,
  line_height = 1.1,
  font = wezterm.font("JetBrains Mono"),
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = 'Whimsy',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
}

return config
