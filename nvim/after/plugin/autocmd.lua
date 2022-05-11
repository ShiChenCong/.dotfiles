vim.cmd [[
  augroup format
    autocmd BufWritePre *.ts,*.tsx EslintFixAll
  augroup end

  augroup luaFormat
    autocmd BufWritePre *.lua lua vim.lsp.buf.format()
  augroup end
]]
