require('trouble').setup({
  follow = false,
  focus = true,
  auto_refresh = false,
  -- auto_fold = true,
  include_declaration = {},
  win = {
    size = {
      height = 15
    }
  },
  ---@type trouble.Window.opts
  preview = { type = 'split', position = 'right', relative = 'win', size = 0.5 }
})

-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>TroubleToggle<cr>', opts)
-- vim.api.nvim_set_keymap('n', '[f', ':lua require("trouble").prev({ skip_groups = true, jump = true })<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']f', ':lua require("trouble").next({ skip_groups = true, jump = true })<CR>', opts)
