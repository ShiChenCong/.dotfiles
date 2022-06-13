vim.g.mapleader = " "
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

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
