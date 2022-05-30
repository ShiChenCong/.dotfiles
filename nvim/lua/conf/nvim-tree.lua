local list_binds = {
  { key = "sl", cb = '<C-w>l' },
  { key = "sf", cb = '<C-w>h' },
  { key = "sv", cb = '' },
  { key = "ss", cb = '' },
}

require 'nvim-tree'.setup {
  view = {
    mappings = {
      list = list_binds,
    },
  },
}

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

--[[
  -- nvim-tree.lua/lua/nvim-tree/actions/open-file.lua 需要改为false
  -- https://github.com/kyazdani42/nvim-tree.lua/pull/1149
 if mode == "preview" then
    local buf_loaded = is_already_loaded(filename)
    return on_preview(false)
  end
--]]
