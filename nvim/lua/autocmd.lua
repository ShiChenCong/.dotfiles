local map = require('util.map')
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
--       local cwd = vim.fn.getcwd()
--       if string.find(cwd, 'dna%-frontend') == nil then
--         vim.lsp.buf.format({ async = false })
--       end
--     end
--   end
-- })

vim.api.nvim_create_augroup("formatOnSave2", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = 'formatOnSave2',
  pattern = { "*.less,*.css,*.html" },
  callback = function()
    local line_count = vim.fn.line('$');
    if line_count < 500 and vim.fn.getfsize(vim.fn.expand('%')) < 5000 then
      vim.cmd('FormatWrite')
    end
  end
})

-- local current_buf = 0
-- local function defx_keymap()
--   vim.keymap.set('n', '<CR>', function()
--     local timer = vim.loop.new_timer()
--     timer:start(10, 0, vim.schedule_wrap(function()
--       if vim.api.nvim_buf_is_loaded(current_buf) then
--         local ok = pcall(vim.api.nvim_buf_delete, current_buf, { force = true })
--         -- vim.cmd('lua vim.o.tabline = "%!v:lua.nvim_bufferline()"')
--         if ok then
--           current_buf = 0
--         else
--           vim.notify('close prev buffer failed', vim.log.levels.WARN)
--         end
--         if timer and not timer:is_closing() then
--           timer:close()
--         end
--       end
--     end))
--     return vim.fn['defx#do_action']('open')
--   end, { buffer = true, expr = true, silent = true })
-- end
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'defx',
--   callback = function()
--     defx_keymap()
--     vim.cmd("autocmd FileType defx nnoremap <buffer> ; :")
--   end,
-- })
--
-- map('n', 'fi', function()
--   current_buf = vim.api.nvim_get_current_buf()
--   vim.cmd [[Defx -new `expand('%:p:h')` -search=`expand('%:p')` -columns=indent:mark:icon:mark:icons:mark:filename:git:size<CR>]]
-- end)

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'fugitive',
--   callback = function()
--     map('n', "sh", '<C-w>h', { buffer = true })
--     map('n', "sj", '<C-w>j', { buffer = true })
--     map('n', "sk", '<C-w>k', { buffer = true })
--     map('n', "sl", '<C-w>l', { buffer = true })
--   end,
-- })

vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    map('n', 'N', '%', { remap = true, buffer = true })
    map('n', 'K', '<Plug>NetrwMakeDir', { remap = true, buffer = true })
    map('n', '.', 'gh', { remap = true, buffer = true })
    map('n', 'd', 'D', { remap = true, buffer = true, nowait = true })
    map('n', 'h', '-', { remap = true, buffer = true })
    map('n', 'l', '<CR>', { remap = true, buffer = true })
    map('n', 'r', 'R', { remap = true, buffer = true })
    map('n', '<leader>fd', function()
      local path = vim.api.nvim_exec("echo b:netrw_curdir", true);
      local file = vim.api.nvim_exec("echo expand('<cfile>')", true);
      local fullPath = path .. '/' .. file;
      require('conf.telescope').telescope_find_word_in_specifeid_file(fullPath)
    end, { remap = true, buffer = true })
  end
})

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
