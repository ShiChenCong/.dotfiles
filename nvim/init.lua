vim.g.mapleader = " "

if not vim.g['vscode'] then
  require('options')
  require('keymaps')
  --require('plugins')
  require('plugins2')
  require('autocmd')
  require('theme')
else
  require('vscode.keymaps')
end
