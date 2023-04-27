local M = {}
M.is_git_dir = function()
  local res = vim.fn.system('git status', true):find('fatal')
  local no_remote = vim.fn.system('git remote -v', true)
  if res == nil and no_remote ~= '' then
    return true
  end
  return false
end

return M
