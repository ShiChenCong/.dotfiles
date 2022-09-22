vim.cmd [[
  augroup cssFormat
    autocmd FileType less,css,html
     \ autocmd BufWritePost <buffer> FormatWrite
  augroup end

  augroup luaFormat
    autocmd BufWritePre *.lua lua vim.lsp.buf.format({sync=true})
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
      autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \   exe "normal zz" |
         \ endif
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
    if (filetype ~= 'Trouble' and filetype ~= "DiffviewFileHistory" and filetype ~= 'NvimTree') then
      vim.cmd [[setlocal nocursorline]]
    end
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

vim.api.nvim_create_augroup('AutoFormat', { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = 'AutoFormat',
  pattern = { "*.tsx", "*.ts", "*.js" },
  callback = function()
    local clients = vim.lsp.get_active_clients()
    local has_eslint = false
    for index, value in ipairs(clients) do
      if value.name == 'eslint' then
        has_eslint = true
      end
    end

    if has_eslint == false then
      vim.cmd [[lua vim.lsp.buf.formatting_sync()]]
    end
  end
})

-- 保存自动格式化
vim.api.nvim_create_augroup("formatOnSave", { clear = false })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = 'formatOnSave',
  pattern = { "*.tsx", "*.ts", "*.js" },
  callback = function()
    local cwd = vim.fn.getcwd()
    if string.find(cwd, 'dna-frontend') == nil then
      vim.cmd [[lua vim.lsp.buf.format({ async = false })]]
    end
  end
})
