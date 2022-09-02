-- local util = require "formatter.util"

require('formatter').setup {
  filetype = {
    -- lua = {
    --   require('formatter.filetypes.lua').stylua,
    -- },
    typescriptreact = {
      -- require('formatter.filetypes.typescriptreact').prettierd
      -- eslint_d  more fast than eslintfixall
      require('formatter.filetypes.typescriptreact').eslint_d
      -- function()
      --   return {
      --     exe = "prettierd",
      --     args = { vim.api.nvim_buf_get_name(0) },
      --     stdin = true
      --   }
      -- end
    },
    typescript = {
      require('formatter.filetypes.typescriptreact').prettierd
    },
    less = {
      require('formatter.filetypes.typescriptreact').prettierd
    },
    css = {
      require('formatter.filetypes.typescriptreact').prettierd
    },
    html = {
      require('formatter.filetypes.typescriptreact').prettierd
    }
  }
}
