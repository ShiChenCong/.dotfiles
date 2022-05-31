-- local util = require "formatter.util"

require('formatter').setup {
  filetype = {
    -- lua = {
    --   require('formatter.filetypes.lua').stylua,
    -- },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettierd
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
