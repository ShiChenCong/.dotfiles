local M = {}
M.init = function(capabilities)
  require 'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  }
end

return M
