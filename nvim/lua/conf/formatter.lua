-- local util = require "formatter.util"

require('formatter').setup {
  filetype = {
    -- lua = {
    --   require('formatter.filetypes.lua').stylua,
    -- },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').denofmt
    }
  }
}
