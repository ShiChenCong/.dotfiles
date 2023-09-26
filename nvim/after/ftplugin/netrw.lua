local map = require('util.map')
local telescope = require('conf.telescope')
local o = vim.opt

o.colorcolumn = nil

-- Line numbers etc in Netrw
map('n', 'N', '%', { remap = true, buffer = true })
-- new Dir
map('n', 'K', '<Plug>NetrwMakeDir', { remap = true, buffer = true })
-- toggle hidden file
map('n', '.', 'gh', { remap = true, buffer = true })
-- delete file
map('n', 'd', function()
  local path = vim.api.nvim_exec("echo b:netrw_curdir", true);
  local file = vim.api.nvim_exec("echo expand('<cfile>')", true);
  local current_path = path .. '/' .. file;
  if vim.fn.isdirectory(current_path) == 1 then
    local confirmation = vim.fn.input("Delete directory " .. current_path .. " and its contents? (y/n): ")
    if confirmation == 'y' or confirmation == 'Y' then
      vim.fn.system('rm -r ' .. current_path)
      vim.cmd('edit ' .. vim.fn.getcwd())
    end
  else
    local confirmation = vim.fn.input("Delete file " .. current_path .. "? (y/n): ")
    if confirmation == 'y' or confirmation == 'Y' then
      vim.fn.delete(current_path)
    end
  end
  vim.cmd('edit ' .. path)
end, { remap = true, buffer = true, nowait = true })
-- backward
map('n', 'h', '-', { remap = true, buffer = true })
-- forward
map('n', 'l', '<CR>', { remap = true, buffer = true })
-- rename
map('n', 'r', 'R', { remap = true, buffer = true })
-- search in the dir under cursor
map('n', '<leader>fd', function()
  local path = vim.api.nvim_exec("echo b:netrw_curdir", true);
  local file = vim.api.nvim_exec("echo expand('<cfile>')", true);
  local fullPath = path .. '/' .. file;
  require('conf.telescope').telescope_find_word_in_specifeid_file(fullPath)
end, { remap = true, buffer = true })
-- reveal in finder
map('n', '<leader>fo', function()
  local path = vim.api.nvim_exec("echo b:netrw_curdir", true);
  local file = vim.api.nvim_exec("echo expand('<cfile>')", true);
  local fullPath = path .. '/' .. file;
  telescope.reveal_in_finder(fullPath)
end, { remap = true, buffer = true })
