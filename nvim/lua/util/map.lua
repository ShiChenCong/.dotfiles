local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

P = function(v)
  print(vim.inspect(v))
  return v
end

local api = vim.api
L = function(filename)
  for _, buf_id in ipairs(api.nvim_list_bufs()) do
    if api.nvim_buf_is_loaded(buf_id) and filename == api.nvim_buf_get_name(buf_id) then
      return true
    end
  end
  return false
end

return map
