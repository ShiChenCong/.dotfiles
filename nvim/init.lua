vim.g.mapleader = " "

if not vim.g['vscode'] then
  require('options')
  require('theme')
  require('keymaps')
  -- require('plugins')
  require('plugins2')
  require('autocmd')
else
  require('vscode.keymaps')
end
