require('trouble').setup({
  -- position = 'left',
  -- width = 30
  padding = false,
  height = 8
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>Trouble<cr>', opts)
vim.api.nvim_set_keymap('n', '[f', ':lua require("trouble").previous({ skip_groups = true, jump = true })<CR>', opts)
vim.api.nvim_set_keymap('n', ']f', ':lua require("trouble").next({ skip_groups = true, jump = true })<CR>', opts)
