local nvim_lsp = require('lspconfig')

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  --  处理useCallback
  if #arr == 2 then
    local first_line = arr[1].targetRange.start.line
    if first_line == arr[2].targetRange.start.line then
      local bufnr = vim.api.nvim_get_current_buf()
      local line = vim.api.nvim_buf_get_lines(bufnr, first_line, first_line + 1,
        false)
      if string.match(line[1], 'useCallback') then
        return arr[1]
      end
    end
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.targetUri, 'react/index.d.ts') == nil
end

local M = {}
M.init = function(capabilities)
  nvim_lsp['ts_ls'].setup {
    capabilities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    settings = {
      -- typescript = {
      --   inlayHints = {
      --     includeInlayParameterNameHints = 'all',
      --     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --     includeInlayFunctionParameterTypeHints = true,
      --     includeInlayVariableTypeHints = true,
      --     includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      --     includeInlayPropertyDeclarationTypeHints = true,
      --     includeInlayFunctionLikeReturnTypeHints = true,
      --     includeInlayEnumMemberValueHints = true,
      --   }
      -- },
      -- javascript = {
      --   inlayHints = {
      --     includeInlayParameterNameHints = 'all',
      --     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --     includeInlayFunctionParameterTypeHints = true,
      --     includeInlayVariableTypeHints = true,
      --     includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      --     includeInlayPropertyDeclarationTypeHints = true,
      --     includeInlayFunctionLikeReturnTypeHints = true,
      --     includeInlayEnumMemberValueHints = true,
      --   }
      -- }
    },
    init_options = {
      preferences = {
        providePrefixAndSuffixTextForRename = false,
      },
      tsserver = {
        path = '/opt/homebrew/lib/node_modules/typescript/lib/tsserver.js'
      }
    },
    handlers = {
      ['textDocument/definition'] = function(err, result, method, ...)
        if vim.islist(result) and #result > 1 then
          local filtered_result = filter(result, filterReactDTS)
          return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
        end

        vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
      end
    }
  }
end

return M
