vim.g.mapleader = " "

if not vim.g['vscode'] then
  require('options')
  require('keymaps')
  require('plugins2')
  require('theme')
  require('autocmd')
else
  require('vscode.keymaps')
end
