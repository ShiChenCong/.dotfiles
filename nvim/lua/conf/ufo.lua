local map = require "util.map"

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

require('ufo').setup()

map('n', '[z', require('ufo.action').goPreviousClosedFold)
map('n', ']z', require('ufo.action').goNextClosedFold)
vim.cmd('hi Folded guibg=NONE guifg=NONE')
