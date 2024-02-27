local wezterm = require 'wezterm'
local mux = wezterm.mux

-- maximize when open
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window {}
  window:gui_window():maximize()
end)

-- 判断当前是哪台电脑
local function getMacModel()
  local f = io.popen("/usr/sbin/system_profiler SPHardwareDataType")
  local info = f:read("*all")
  f:close()
  local model = info:match("Model Identifier: ([%w_]+)")
  if model == "MacBookPro" then
    return "MacBook Pro"
  elseif model == "Macmini9" then
    return "Mac mini9"
  else
    return "Unknown"
  end
end

local config = {
  font_size = getMacModel() == 'Mac mini9' and 24 or 17,
  line_height = 1.1,
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "苹方-简"
  }),
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = 'Whimsy',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  enable_csi_u_key_encoding = true,
  -- cursor_blink_ease_in = "Constant",
  -- cursor_blink_ease_out = "Constant",
  colors = {
    background = '#25273a'
  },
  -- window_background_opacity = 0.9,
  -- macos_window_background_blur = 30
}

return config
