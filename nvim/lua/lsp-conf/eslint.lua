---@diagnostic disable: unused-local
local nvim_lsp = require('lspconfig')
local keep_position = require('util.keep_position')

local M = {}
M.init = function(capabilities)
  nvim_lsp.eslint.setup {
    -- settings = { format = false },
    -- on_attach = function()
    --   vim.api.nvim_create_augroup('AutoFormatAndFixEslint', { clear = true })
    --   vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    --     group = 'AutoFormatAndFixEslint',
    --     pattern = { "*.tsx", "*.ts", "*.js", "*.jsx" },
    --     callback = function()
    --       local errorList = vim.diagnostic.get(0)
    --       for index, value in ipairs(errorList) do
    --         if value.severity == 1 and value.source == 'eslint' then
    --           -- vim.cmd [[EslintFixAll]]
    --           -- vim.cmd [[FormatWrite]]
    --           break
    --         end
    --       end
    --     end
    --   })
    -- end,
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
