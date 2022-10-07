local list_binds = {
  { key = "sl", cb = '<C-w>l' },
  { key = "sf", cb = '<C-w>h' },
  { key = "sv", cb = '' },
  { key = "ss", cb = '' },
  { key = "l", action = 'edit' },
  { key = "<leader>fd", action = "find word", action_cb = function(node)
    print(node.absolute_path)
    require('conf.telescope').telescope_find_word_in_specifeid_file(node.absolute_path)
  end },
}
local git_icons = {
  unstaged = "",
  staged = "",
  unmerged = "",
  renamed = "➜",
  untracked = "",
  deleted = "",
  ignored = "◌"
}
require 'nvim-tree'.setup {
  view = {
    mappings = {
      list = list_binds,
    },
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    icons = {
      glyphs = {
        git = git_icons
      }
    }
  }
}

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
