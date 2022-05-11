vim.cmd [[
  augroup format
    autocmd FileType typescript,typescriptreact
     \ autocmd BufWritePre <buffer> EslintFixAll
  augroup end
  
  augroup cssFormat
    autocmd FileType less,css
     \ autocmd BufWritePre <buffer> Prettier
  augroup end

  augroup luaFormat
    autocmd BufWritePre *.lua lua vim.lsp.buf.format()
  augroup end
]]
