-- 设置自动保存时的格式化、EslintFix等
vim.cmd [[
  augroup format
    autocmd FileType typescript,typescriptreact,javascript
     \ autocmd BufWritePre <buffer> EslintFixAll
  augroup end
  
  augroup cssFormat
    autocmd FileType less,css,html
     \ autocmd BufWritePost <buffer> FormatWrite
  augroup end

  augroup luaFormat
    autocmd BufWritePre *.lua lua vim.lsp.buf.format()
  augroup end

  " 新一行 不带上行的注释
  augroup newlineWithoutComment
    autocmd BufEnter * set fo-=c fo-=r fo-=o
  augroup end

  augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
  augroup END

  augroup termOpenInsert
    autocmd TermOpen * startinsert
  augroup END

  " no numbers in term mode
  augroup termNoNumber
    au TermOpen * setlocal nonumber norelativenumber nospell
  augroup END
  
  augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

  augroup gotoLastPosition
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup end
]]

vim.cmd [[
  "设置cmp float 弹框样式
  highlight FloatBorder guibg=#02b36
  highlight NormalFloat guibg=#02b36

  " 设置匹配单词高亮
  hi! LspReferenceRead cterm=bold ctermbg=red guibg=#1c4c5e
  hi! LspReferenceText cterm=bold ctermbg=red guibg=#1c4c5e
  hi! LspReferenceWrite cterm=bold ctermbg=red guibg=#1c4c5e

  "LSP 提示改为下划线
  hi DiagnosticUnderlineWarn gui=undercurl
  hi DiagnosticUnderlineError gui=undercurl
  hi DiagnosticUnderlineInfo gui=undercurl
  hi DiagnosticUnderlineHint gui=undercurl
]]

vim.api.nvim_create_augroup("setWinbar", { clear = false })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = 'setWinbar',
  callback = function()
    require("winbar").get_winbar()
  end,
})

vim.api.nvim_create_augroup("leaveSetCursorLine", { clear = false })
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  group = 'leaveSetCursorLine',
  callback = function()
    local filetype = vim.bo.filetype;
    if (filetype ~= 'Trouble' and filetype ~= "DiffviewFileHistory") then
      vim.cmd [[setlocal nocursorline]]
    end
  end
})
