local M = {}
M.get_listed_buf_count = function()
  local buf_len = #vim.fn.getbufinfo({ buflisted = 1 })
  return buf_len
  -- local count = 0
  -- for _text, value in ipairs(buf_len) do
  --   if value.hidden == 0 then
  --     count = count + 1
  --   end
  -- end
  -- return count
end

return M
