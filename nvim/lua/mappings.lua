local map = require('util.map')
map('n', "<BS>", ':noh<CR>')

map('i', "<A-s>", "<Esc> :w<CR>")
map('n', "<A-s>", ":w<CR>")
