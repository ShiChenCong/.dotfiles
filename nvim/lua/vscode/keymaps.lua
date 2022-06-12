local map = require "util.map"
map('n', 'L', '$')
map('v', 'L', "$")
map('n', 'H', '^')
map('v', 'H', "^")
map('n', ";", ":")
-- map('n', '{', "{zz")
-- map('n', '}', "}zz")
map('n', "<BS>", ':noh<CR>')
map('n', ";", ":")

-- 前进光标记录newer
map('n', "si", "<C-i>")
-- 后退光标记录older
map('n', "so", "<C-o>")
--ciw不会yank改变的单词
map('n', 'c', '"_c')
map('x', 'c', '"_c')
-- map('n', 'C', '"_c')
-- 覆盖选中的部门 不会yank
map('v', 'p', '"_dP')
map('n','p',"p`]")

map('n', '<tab>', "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
map('n', '<S-tab>', "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")
map('n', 'sv', "<Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>")
map('n', 'ss', "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>")
map('n', '<leader>o', "<Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>")
map('n', '<leader>co', "<Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>")
map('n', 'gr', "<Cmd>call VSCodeNotify('references-view.findReference')<CR>")
map('n', '[d', "<Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>")
map('n', ']d', "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
map('n', '<leader>rn', "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
map('n', 'u', "<Cmd>call VSCodeNotify('undo')<CR>")
map('n', '<C-r>', "<Cmd>call VSCodeNotify('redo')<CR>")
map('n', 'za', "<cmd>call VSCodeNotify('editor.toggleFold')<CR>")

--debug
map('n', '<leader>d', "<cmd>call VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>")
-- 注释
map('x', 'gc', '<Plug>VSCodeCommentary')
map('n', 'gc', '<Plug>VSCodeCommentary')
map('o', 'gc', '<Plug>VSCodeCommentary')
map('n', 'gcc', '<Plug>VSCodeCommentaryLine')

--文件树相关
map('n', '<leader>fc', "<cmd>call VSCodeNotify('workbench.files.action.collapseExplorerFolders')")
map('n', 'fi', "<Cmd>call VSCodeNotify('revealInExplorer')<CR>")

--surround
map('n', "<leader>'", '<Plug>Ysurroundiw\""')
map('n', '<leader>[', '<Plug>Ysurroundiw]"')
map('n', '<leader>{', '<Plug>Ysurroundiw{"')
map('n', '<leader>(', '<Plug>Ysurroundiw("')
--git相关
map('n', '<leader>gfh', "<cmd>call VSCodeNotify('gitlens.diffWithPrevious')<cr>")
map('n', ']c', "<cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>")
map('n', '[c', "<cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>")

-- 跳转也能加到jumplist
vim.cmd [[
  nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
  nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
]]

-- options设置
vim.opt['clipboard'] = 'unnamedplus'
vim.cmd[[
  autocmd BufNewFile,BufRead,BufWritePost Buf * set formatoptions-=ro
]]