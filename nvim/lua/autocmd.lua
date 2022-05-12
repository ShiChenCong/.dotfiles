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

vim.cmd [[
  highlight NormalFloat guibg=#02b36
  highlight FloatBorder guibg=#02b36
  highlight VertSplit guibg=NONE guifg=#3b3f49 cterm=NONE
]]
