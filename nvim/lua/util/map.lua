local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

P         = function(v)
  vim.notify(vim.inspect(v))
  return v
end

local api = vim.api
L         = function(filename)
  for _, buf_id in ipairs(api.nvim_list_bufs()) do
    if api.nvim_buf_is_loaded(buf_id) and filename == api.nvim_buf_get_name(buf_id) then
      return true
    end
  end
  return false
end

-- 把message插入到当前光标下 put =execute('messages')
I         = function(command, buffer_id, isRowVim)
  local id = buffer_id or 0
  local current_line = vim.api.nvim_win_get_cursor(0)[1];
  local handle_command
  if isRowVim then
    handle_command = command
  else
    handle_command = "lua P(" .. command .. ")"
  end
  local value = vim.api.nvim_exec(handle_command, true)
  local lines = {}
  for line in string.gmatch(value, "[^\r\n]+") do
    table.insert(lines, line)
  end
  vim.api.nvim_buf_set_lines(id, current_line, current_line + 1, false, lines)
end

return map
