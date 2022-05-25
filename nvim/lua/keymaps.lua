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

-- 关闭当前
map('n', ',d', function()
  local len = #vim.api.nvim_list_wins()
  local bufferLen = vim.api.nvim_exec("echo len(getbufinfo({'buflisted':1}))", true)
  if (len > 1) then
    if (bufferLen == "1") then
      vim.cmd("q")
    else
      vim.cmd("b#|bd#")
    end
  else
    vim.cmd("bd!")
  end
end)
-- 关闭当前window
map('n', ',q', ":q<CR>")

-- BufferLine
map('n', '<leader>co', '<Cmd>BufferLineCloseRight <CR> <Cmd>BufferLineCloseLeft<CR>')
map('n', '<leader>cr', '<Cmd>BufferLineCloseRight<CR>')
map('n', '<leader>cl', '<Cmd>BufferLineCloseLeft<CR>')
map('n', 'mr', '<Cmd>BufferLineMoveNext<CR>')
map('n', 'ml', 'Cmd>BufferLineMovePrev<CR>')

-- vim-fugitive
map('n', '<leader>gp', ':Git! push<CR>')
