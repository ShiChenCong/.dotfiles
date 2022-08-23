local M = {}

M.stay_position = function(fn)
  local cursorPosition = vim.api.nvim_win_get_cursor(0)
  local row = cursorPosition[1]
  local col = cursorPosition[2]
  local lastline = vim.fn.line('$')

  local info = vim.fn.getwininfo();
  local topline = info[1].topline

  fn()

  -- 如果执行undo之后的topline不等于执行之前的topline
  if lastline > row and vim.api.nvim_win_get_cursor(0)[1] ~= row then
    vim.api.nvim_win_set_cursor(0, { topline, 0 })
    vim.cmd.normal('zt')
    vim.api.nvim_win_set_cursor(0, { row, col })
  end
end

return M
