require("onedark").setup({
  transparent = false,
  dark_float = false,
  hide_inactive_statusline = true,
  dark_sidebar = false,
  dev = true,
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "NONE",
  variable_style = "NONE",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000", bg="#282C34"}
})
