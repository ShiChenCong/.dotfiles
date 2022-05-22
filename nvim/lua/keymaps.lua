local map = require('util.map')
map('n', "<BS>", ':noh<CR>')

map('i', "<A-s>", "<Esc> :w<CR>")
map('n', "<A-s>", ":w<CR>")

map('n', "<leader>,", ":split<bar>below<bar>resize 10<bar>term<CR>")

map('n', '<C-h>', '<C-\\><C-N><C-h>')
map('n', '<C-l>', '<C-\\><C-N><C-l>')
map('n', '<C-j>', '<C-\\><C-N><C-j>')
map('n', '<C-k>', '<C-\\><C-N><C-k>')
