local nvim_lsp = require('lspconfig')
local map = require('util.map')
-- 配合nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'html', 'cssls', 'tailwindcss', 'jsonls', 'rust_analyzer', 'lua_ls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
  }
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map('n', 'gd', vim.lsp.buf.definition, bufopts)
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- map('n', '<space>rn', ":Lspsaga rename<CR>", bufopts)
    map('n', '<space>.', vim.lsp.buf.code_action, bufopts)
    map('n', '<space>gi', '<cmd>Trouble lsp_implementations<cr>', bufopts)
    map('n', 'gr', '<cmd>TroubleToggle lsp_references<cr>', bufopts)
    map('n', '<leader>gr', function() vim.lsp.buf.references({ includeDeclaration = false }) end, bufopts)
    map('n', '<space>o', ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
    map('n', '<space>l', ":lua vim.diagnostic.open_float({max_width=100})<CR>")
    map('n', '<leader>[d', vim.diagnostic.goto_prev)
    map('n', '<leader>]d', vim.diagnostic.goto_next)
    map('n', '[d', function()
      local errorList = vim.diagnostic.get(0)
      local has_error = false;
      for _, value in ipairs(errorList) do
        if value.severity == 1 then
          has_error = true
          break
        end
      end
      -- 有错误的时候跳转错误，没有错误则跳转信息提示
      if has_error then
        vim.diagnostic.goto_prev({ float = { max_width = 100 }, severity = vim.diagnostic.severity.ERROR })
      else
        vim.diagnostic.goto_prev({ float = { max_width = 100 } })
      end
    end)
    map('n', ']d', function()
      local errorList = vim.diagnostic.get(0)
      local has_error = false;
      for _, value in ipairs(errorList) do
        if value.severity == 1 then
          has_error = true
          break
        end
      end
      if has_error then
        vim.diagnostic.goto_next({ float = { max_width = 100 }, severity = vim.diagnostic.severity.ERROR })
      else
        vim.diagnostic.goto_next({ float = { max_width = 100 } })
      end
    end)
  end,
})
local signs = {
  { name = "DiagnosticSignError", text = '󰅚 ', texthl = 'DiagnosticSignError' },
  { name = "DiagnosticSignWarn", text = '󰀪 ', texthl = 'DiagnosticSignWarn' },
  { name = "DiagnosticSignInfo", text = '󰋽 ', texthl = 'DiagnosticSignInfo' },
  { name = "DiagnosticSignHint", text = '󰌶 ', texthl = 'DiagnosticSignHint' },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.texthl })
end

local config = {
  virtual_text = false,
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  -- Lsp报错的提示框
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

require 'lsp-conf.tsserver'.init(capabilities)
require 'lsp-conf.eslint'.init(capabilities)

-- LspInfo的边框
require('lspconfig.ui.windows').default_options.border = 'single'

-- -- 全局统一修改Hover的信息框
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
