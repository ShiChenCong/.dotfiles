vim.g.mapleader = " "

if not vim.g['vscode'] then
  require('options')
  require('keymaps')
  require('plugins')
  require('theme')
  require('autocmd')
  require('im-select').setup {
      default_im_select    = "com.apple.keylayout.ABC",
      disable_auto_restore = 0,
      default_command      = 'im-select'
  }
else
  require('vscode.keymaps')
end
