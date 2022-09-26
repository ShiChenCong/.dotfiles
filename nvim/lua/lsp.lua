local nvim_lsp = require('lspconfig')
local map = require('util.map')

map('n', '<space>l', ":lua vim.diagnostic.open_float({max_width=100})<CR>")
map('n', '[d', ":lua vim.diagnostic.goto_prev({float = {max_width = 100}})<CR>")
map('n', ']d', ":lua vim.diagnostic.goto_next({float = {max_width = 100}})<CR>")
map('n', '<space>q', vim.diagnostic.setloclist)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- map('n', '<space>rn', require('ui.renamer').open)
  map('n', '<space>.', vim.lsp.buf.code_action, bufopts)
  -- map('n', 'gr', function() vim.lsp.buf.references({ includeDeclaration = false }) end, bufopts)
  map('n', 'gr', '<cmd>TroubleToggle lsp_references<cr>', bufopts)
  map('n', '<space>o', ":lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
  -- map('n', '<space>o', ":lua vim.lsp.buf.formatting_sync()<CR>", bufopts)

  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.server_capabilities.colorProvider then
    require("document-color").buf_attach(bufnr)
  end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'html', 'cssls', 'tailwindcss', 'jsonls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function()
      return vim.fn.getcwd()
    end,
  }
end

local signs = {
  { name = "DiagnosticSignError", text = ' ', texthl = 'DiagnosticSignError' },
  { name = "DiagnosticSignWarn", text = ' ', texthl = 'DiagnosticSignWarn' },
  { name = "DiagnosticSignInfo", text = ' ', texthl = 'DiagnosticSignInfo' },
  { name = "DiagnosticSignHint", text = ' ', texthl = 'DiagnosticSignHint' },
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

require 'lsp-conf.tsserver'.init(on_attach, capabilities)
require 'lsp-conf.lua'.init(on_attach, capabilities)
require 'lsp-conf.eslint'.init(capabilities)

local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'single'
  return opts
end
-- 全局统一修改
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "rounded"
}
)
