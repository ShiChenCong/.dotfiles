local dap = require('dap')
local map = require('util.map')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/draft/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'LspDiagnosticsError', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStoppedColor', linehl = 'DapStoppedColor', numhl = 'DapStoppedColor' })
vim.api.nvim_set_hl('DapStoppedColor', { ctermbg = 0, guibg = '#4b4b20' }, false)
-- 添加断点
map('n', 'db', ':lua require"dap".toggle_breakpoint()<CR>')
-- map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- map('n', "<c-l>", ':lua require"dap".step_into()<CR>')
-- map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
-- map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
map('n', '<A-l>', ':lua require"dap".continue()<CR>')
-- map('n', 'dc', ':lua require"dap".run_to_cursor()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')
-- map('n', '<leader>dc', ':lua require"dap".terminate()<CR>')
map('n', 'dc', ':lua require"dap".clear_breakpoints()<CR>')
map('n', 'dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
-- 开始attach node进程
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
-- map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', 'dk', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- vim.cmd [[au FileType dap-repl lua require('dap.ext.autocompl').attach()]]
