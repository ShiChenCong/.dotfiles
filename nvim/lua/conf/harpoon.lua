local ok, harpoon = pcall(require, 'harpoon')
if not ok then
  vim.notify('load harpoon fail')
end

local map = require('util.map')

vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- map('n', 'gh', ':lua require("harpoon.ui").nav_file(1)<CR>')
-- map('n', 'gj', ':lua require("harpoon.ui").nav_file(2)<CR>')
-- map('n', 'gk', ':lua require("harpoon.ui").nav_file(3)<CR>')
-- map('n', 'gl', ':lua require("harpoon.ui").nav_file(3)<CR>')

harpoon.setup({
  -- menu = {
  --   width = vim.api.nvim_win_get_width(0) - 40,
  -- },
  -- global_settings = {
  --   mark_branch = true,
  -- }
})
