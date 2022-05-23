local map = require('util.map')
map('n', "<BS>", ':noh<CR>')

map('i', "<A-s>", "<Esc> :w<CR>")
map('n', "<A-s>", ":w<CR>")

map('n', "<leader>,", ":split<bar>below<bar>resize 10<bar>term<CR>")

-- terminal move
map('n', '<C-h>', '<C-\\><C-N><C-h>')
map('n', '<C-l>', '<C-\\><C-N><C-l>')
map('n', '<C-j>', '<C-\\><C-N><C-j>')
map('n', '<C-k>', '<C-\\><C-N><C-k>')

map('n', ',d', function() require('bufdelete').bufdelete(0, true) end)

-- BufferLine
map('n', '<leader>co', '<Cmd>BufferLineCloseRight <CR> <Cmd>BufferLineCloseLeft<CR>')
map('n', '<leader>cr', '<Cmd>BufferLineCloseRight<CR>')
map('n', '<leader>cl', '<Cmd>BufferLineCloseLeft<CR>')
map('n', 'mr', '<Cmd>BufferLineMoveNext<CR>')
map('n', 'ml', 'Cmd>BufferLineMovePrev<CR>')

-- vim-fugitive
map('n', '<leader>gp', ':Git push<CR>')
