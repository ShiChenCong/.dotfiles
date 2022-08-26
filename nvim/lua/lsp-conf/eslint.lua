local nvim_lsp = require('lspconfig')

local M = {}
M.init = function(capabilities)
  nvim_lsp.eslint.setup {
    on_attach = function()
      vim.api.nvim_create_augroup('AutoFormatAndFixEslint', { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = 'AutoFormatAndFixEslint',
        pattern = { "*.tsx", "*.ts", "*.js" },
        callback = function()
          vim.cmd [[normal mf]]
          vim.cmd.normal('mF')
          vim.cmd [[%!eslint_d --stdin --fix-to-stdout --stdin-filename %]]
          vim.cmd.normal('`F')
        end
      })
    end,
    capabilities = capabilities,
    root_dir = function()
      return vim.fn.getcwd()
    end,
    -- 修复eslint 报错https://neovim.discourse.group/t/supressing-eslint-ls-errors/1687
    handlers = {
      ['window/showMessageRequest'] = function(_, result, params) return result end
    }
  }
end
return M
