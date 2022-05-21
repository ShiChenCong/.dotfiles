local winbar = {}

vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = '#6f656c' })
vim.api.nvim_set_hl(0, "WinBarContent", { fg = '#4b8265', bg = '#6f656a' })

winbar.eval = function()
  if vim.api.nvim_eval_statusline("%f", {})["str"] == "[No Name]" then
    return ""
  end
  return "%#WinBarSeparator#"
      .. ""
      .. "%*"
      .. "%#WinBarContent#"
      .. "%f"
      .. "%*"
      .. "%#WinBarSeparator#"
      .. ""
      .. "%*"
end

return winbar
