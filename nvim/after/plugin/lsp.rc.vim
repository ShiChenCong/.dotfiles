lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>', opts)
  buf_set_keymap('n', 'grd', '<cmd>lua vim.lsp.buf.references({ includeDeclaration = true })<CR>', opts)
  -- buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>o', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  client.resolved_capabilities.document_formatting = true

  if client.resolved_capabilities.document_formatting then
     vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
   -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[ autocmd BufWritePre <buffer> EslintFixAll ]]
    vim.api.nvim_command [[augroup END]]
  end

end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {'html', 'cssls', 'eslint'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities=capabilities,
    flags = {
      debounce_text_changes = 150,
    },
 -- handlers = {
 --      ["textDocument/publishDiagnostics"] = vim.lsp.with(
 --        vim.lsp.diagnostic.on_publish_diagnostics, {
 --          -- Disable virtual_text
 --          virtual_text = false
 --        }
 --      ),
 -- }
}
end 

nvim_lsp['tsserver'].setup{
   handlers = {
      ["textDocument/definition"] = function(_, result, params)
      if result == nil or vim.tbl_isempty(result) then
         local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, 'No location found')
         return nil
      end


      if vim.tbl_islist(result) then
         vim.lsp.util.jump_to_location(result[1])
         if #result > 1 then
            local isReactDTs = false
            for key, value in pairs(result) do
               if string.match(value.uri, "react/index.d.ts") then
                  isReactDTs = true
			      break
               end
            end
            if not isReactDTs then
               vim.lsp.util.set_qflist(util.locations_to_items(result))
               vim.api.nvim_command("copen")
               vim.api.api.nvim_command("wincmd p")
            end
         end
      else
         vim.lsp.util.jump_to_location(result)
      end

   end
}
}

vim.fn.sign_define("DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
    {text = "", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
    {text = "", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
    {text = "", texthl = "DiagnosticSignHint"})

-- eslint 的需要单独配置
-- local eslint_attach = function(client)
--     client.resolved_capabilities.document_formatting = true
--     -- 代码保存自动格式化formatting
--     if client.resolved_capabilities.document_formatting then
--     vim.api.nvim_command [[augroup Format]]
--     vim.api.nvim_command [[autocmd! * <buffer>]]
--     --vim.api.nvim_command [[autocmd BufWritePre <buffer> EslintFixAll]]
--     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--     vim.api.nvim_command [[augroup END]]
--   end
-- end
-- 
-- require "lspconfig".eslint.setup {
--   on_attach = eslint_attach,
--   capabilities=capabilities,
--   flags = {
--     debounce_text_changes = 150,
--   }
-- }
EOF
