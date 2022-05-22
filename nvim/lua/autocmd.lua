-- 设置自动保存时的格式化、EslintFix等
vim.cmd [[
  augroup format
    autocmd FileType typescript,typescriptreact,javascript
     \ autocmd BufWritePre <buffer> EslintFixAll
  augroup end
  
  augroup cssFormat
    autocmd FileType less,css
     \ autocmd BufWritePre <buffer> Prettier
  augroup end

  augroup luaFormat
    autocmd BufWritePre *.lua lua vim.lsp.buf.format()
  augroup end

  " 新一行 不带上行的注释
  augroup newlineWithoutComment
    autocmd BufEnter * set fo-=c fo-=r fo-=o
  augroup end

  "defx 映射;
  augroup defxMap
    autocmd FileType defx nnoremap <buffer> ; :
  augroup end

  augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END

  augroup termOpenInsert
    autocmd TermOpen * startinsert
  augroup END

  " no numbers in term mode
  augroup termNoNumber
    au TermOpen * setlocal nonumber norelativenumber nospell
  augroup END
]]

vim.cmd [[
  "设置cmp float 弹框样式
  highlight NormalFloat guibg=#02b36
  highlight FloatBorder guibg=#02b36
  "设置分割线颜色
  highlight VertSplit guibg=NONE guifg=#3b3f49 cterm=NONE

  " 设置匹配单词高亮
  hi! LspReferenceRead cterm=bold ctermbg=red guibg=#1c4c5e
  hi! LspReferenceText cterm=bold ctermbg=red guibg=#1c4c5e
  hi! LspReferenceWrite cterm=bold ctermbg=red guibg=#1c4c5e

  hi DiagnosticUnderlineWarn gui=undercurl
  hi DiagnosticUnderlineError gui=undercurl
  hi DiagnosticUnderlineInfo gui=undercurl
  hi DiagnosticUnderlineHint gui=undercurl
]]

vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = "lsp_document_highlight",
  pattern = { "*.js", "*.ts", "*.tsx" },
  callback = function()
    vim.cmd('lua vim.lsp.buf.document_highlight()')
  end
})
vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
  group = "lsp_document_highlight",
  pattern = { "*.js", "*.ts", "*.tsx" },
  callback = function()
    vim.cmd('lua vim.lsp.buf.document_highlight()')
  end
})

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  group = "lsp_document_highlight",
  pattern = { "*.js", "*.ts", "*.tsx" },
  callback = function()
    vim.cmd('lua vim.lsp.buf.clear_references()')
  end
})
