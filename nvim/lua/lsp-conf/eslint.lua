---@diagnostic disable: unused-local
local nvim_lsp = require('lspconfig')
local keep_position = require('util.keep_position')
local formatter = require('formatter.format')
local log = require "formatter.log"
local util = require "formatter.util"

local M = {}
M.init = function(capabilities)
  nvim_lsp.eslint.setup {
    on_attach = function()
      vim.api.nvim_create_augroup('AutoFormatAndFixEslint', { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = 'AutoFormatAndFixEslint',
        pattern = { "*.tsx", "*.ts", "*.js" },
        callback = function()
          local errorList = vim.diagnostic.get(0)
          for index, value in ipairs(errorList) do
            if value.severity == 1 and value.source == 'eslint' then
              keep_position.stay_position(function()
                log.current_format_mods = ''
                formatter.start_task({ {
                  config = {
                    exe = "eslint_d",
                    args = {
                      "--stdin",
                      "--stdin-filename",
                      util.escape_path(util.get_current_buffer_file_path()),
                      "--fix-to-stdout",
                    },
                    stdin = true,
                    try_node_modules = true,
                  },
                  name = "eslint_d"
                } }, vim.fn.line('w0'), vim.fn.line("$"), { write = true })

              end)
              break
            end
          end
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
