vim.g.mapleader = ' '
vim.cmd [[source $HOME/.config/nvim/config/mappings.vim]]
require('options')
require('lsp')
require('autocmd')
require('theme')
require('conf')
require('mappings')
require('plugins')
--require('statusline')
--require('global')
--require('winbar')
--vim.opt.winbar = "%{%v:lua.require'winbar'.eval()%}"
