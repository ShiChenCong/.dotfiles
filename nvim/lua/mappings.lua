local map = require('util.map')
map('n', "<BS>", ':noh<CR>')

map('i', "<A-s>", "<Esc> :w<CR>")
map('n', "<A-s>", ":w<CR>")

map('n', "<leader>,", ":terminal<CR>  i")
