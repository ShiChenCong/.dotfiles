local dap = require('dap')
local map = require('util.map')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/draft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'LspDiagnosticsError', linehl = '', numhl = '' })
vim.highlight.create('DapStoppedColor', { ctermbg = 0, guibg = '#4b4b20' }, false)
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStoppedColor', linehl = 'DapStoppedColor', numhl = 'DapStoppedColor' })
-- 添加断点
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
-- map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- map('n', "<c-l>", ':lua require"dap".step_into()<CR>')
-- map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
-- map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
map('n', '<A-h>', ':lua require"dap".continue()<CR>')
map('n', '<leader>dc', ':lua require"dap".run_to_cursor()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')
-- map('n', '<leader>dc', ':lua require"dap".terminate()<CR>')
map('n', '<leader>dcb', ':lua require"dap".clear_breakpoints()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
-- 开始attach node进程
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
-- map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>dh', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

vim.cmd [[au FileType dap-repl lua require('dap.ext.autocompl').attach()]]
