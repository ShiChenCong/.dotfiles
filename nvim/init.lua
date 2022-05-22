vim.g.mapleader = " "
vim.cmd [[source $HOME/.config/nvim/config/mappings.vim]]

require('options')
require('lsp')
require('theme')
require('conf')
require('keymaps')
require('plugins')
require('autocmd')
--require('statusline')
--require('global')
--require('winbar')
--vim.opt.winbar = "%{%v:lua.require'winbar'.eval()%}"
