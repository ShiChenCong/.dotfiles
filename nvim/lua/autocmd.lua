local map = require('util.map')
local telescope = require('conf.telescope')
-- vim.cmd [[
--   augroup termOpenInsert
--     autocmd TermOpen * startinsert
--   augroup END
--
--   " no numbers in term mode
--   augroup termNoNumber
--     au TermOpen * setlocal nonumber norelativenumber nospell
--   augroup END
--
--   augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
--     autocmd!
--     autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
--   augroup end
-- ]]
-- "设置cmp float 弹框样式
-- highlight FloatBorder guibg=#02b36
-- highlight NormalFloat guibg=#02b36
vim.cmd [[

  " 设置匹配单词高亮
  hi IlluminatedWordRead guibg=#1c4c5e gui=NONE
  hi IlluminatedWordText guibg=#1c4c5e gui=NONE
  hi IlluminatedWordWrite guibg=#1c4c5e gui=NONE

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

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   command = "set fo-=c fo-=r fo-=o",
-- })

-- vim.api.nvim_create_augroup("formatOnSave", { clear = false })
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = 'formatOnSave',
--   pattern = { "*.tsx", "*.ts", "*.js", "*.lua", "*.rs" },
--   callback = function()
--     local line_count = vim.fn.line('$');
--     -- 行数小于500 && 文件小于10k才再保存的时候 执行格式化
--     if line_count < 500 and vim.fn.getfsize(vim.fn.expand('%')) < 10240 then
--         vim.lsp.buf.format({ async = false })
--     end
--   end
-- })

-- 最新版本支持lsp直接格式化
-- vim.api.nvim_create_augroup("formatOnSave2", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   group = 'formatOnSave2',
--   pattern = { "*.less,*.css,*.html" },
--   callback = function()
--     local line_count = vim.fn.line('$');
--     if line_count < 500 and vim.fn.getfsize(vim.fn.expand('%')) < 5000 then
--       vim.cmd('FormatWrite')
--     end
--   end
-- })


-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'fugitive',
--   callback = function()
--     map('n', "sh", '<C-w>h', { buffer = true })
--     map('n', "sj", '<C-w>j', { buffer = true })
--     map('n', "sk", '<C-w>k', { buffer = true })
--     map('n', "sl", '<C-w>l', { buffer = true })
--   end,
-- })

-- vim.api.nvim_create_augroup("hl_cursor_line", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
--   group = "hl_cursor_line",
--   callback = function()
--     vim.cmd("set cursorline")
--   end
-- })

-- vim.api.nvim_create_augroup("leaveSetCursorLine", { clear = false })
-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
--   group = 'leaveSetCursorLine',
--   callback = function()
--     local filetype = vim.bo.filetype;
--     local excluded_filetypes = { 'Trouble', 'DiffviewFileHistory', 'NvimTree', 'DiffviewFiles' }
--     if not vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
--       vim.cmd [[setlocal nocursorline]]
--     end
--   end
-- })

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { "Trouble", "defx" },
--   callback = function()
--     vim.cmd('set cursorline')
--   end,
-- })

vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    local line_count = vim.fn.line('$');
    if line_count > 500 or vim.fn.getfsize(vim.fn.expand('%')) > 102400 then
      -- if vim.fn.getfsize(vim.fn.expand('%')) > 10000 then -- 1 MB
      vim.opt_local.foldmethod = 'manual'
      vim.opt_local.foldexpr = '0'
      vim.opt_local.syntax = 'off'
    end
  end,
})

bus = {}
cur = nil
pre = nil
vim.api.nvim_create_augroup("delete_pre_buffer", { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  group = "delete_pre_buffer",
  callback = function()
    if cur == nil and pre == nil then
      pre = vim.api.nvim_get_current_buf()
      cur = vim.api.nvim_get_current_buf()
    else
      table.insert(bus, cur)
      pre = cur
      cur = vim.api.nvim_get_current_buf()
    end
  end
})

map('n', 'dp', function()
  local last_buf_num = bus[#bus]
  if last_buf_num ~= nil and vim.api.nvim_buf_is_loaded(last_buf_num) then
    vim.cmd("bd " .. table.remove(bus))
    vim.cmd('lua vim.o.tabline = "%!v:lua.nvim_bufferline()"')
  end
end)
