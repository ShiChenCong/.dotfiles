local ok, harpoon = pcall(require, 'harpoon')
if not ok then
  vim.notify('load harpoon fail')
end

local map = require('util.map')

map('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>h', 'require("harpoon.ui").nav_file(1)<CR>')
map('n', '<leader>j', 'require("harpoon.ui").nav_file(2)<CR>')
map('n', '<leader>k', 'require("harpoon.ui").nav_file(3)<CR>')

harpoon.setup({ menu = { width = 90, height = 6 } })
