vim.g.mapleader = " "

if not vim.g['vscode'] then
  require('impatient')
  require('options')
  require('lsp')
  require('theme')
  require('conf')
  require('keymaps')
  require('plugins')
  require('autocmd')
else
  require('vscode.keymaps')
end
