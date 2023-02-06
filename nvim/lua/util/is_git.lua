local M = {}
M.is_git_dir = function()
  local res = vim.fn.system('git status', true):find('fatal')
  if res == nil then
    return true
  end
  return false
end

return M
