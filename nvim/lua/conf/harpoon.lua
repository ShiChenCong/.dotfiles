local ok, harpoon = pcall(require, 'harpoon')
if not ok then
  vim.notify('load harpoon fail')
end

local map = require('util.map')

map('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
-- map('n', 'gh', ':lua require("harpoon.ui").nav_file(1)<CR>')
-- map('n', 'gj', ':lua require("harpoon.ui").nav_file(2)<CR>')
-- map('n', 'gk', ':lua require("harpoon.ui").nav_file(3)<CR>')
-- map('n', 'gl', ':lua require("harpoon.ui").nav_file(3)<CR>')

harpoon.setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 40,
  }
})
