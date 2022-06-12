local map = require "util.map"
map('n', 'L', '$')
map('v', 'L', "$")
map('n', ";", ":")
map('n', '<tab>', "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
map('n', '<S-tab>', "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")
map('n', 'fi', "<Cmd>call VSCodeNotify('revealInExplorer')<CR>")
map('n', 'sv', "<Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>")
map('n', 'ss', "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>")
map('n', '<leader>o', "<Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>")
map('n', '<leader>co', "<Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>")
map('n', 'gr', "<Cmd>call VSCodeNotify('references-view.findReference')<CR>")
map('n', '[d', "<Cmd>call VSCodeNotify('editor.action.marker.pre')<CR>")
map('n', ']d', "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
map('n', '<leader>rn', "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
map('n', 'u', "<Cmd>call VSCodeNotify('undo')<CR>")
map('n', '<C-r>', "<Cmd>call VSCodeNotify('redo')<CR>")
map('n', 'za', "<cmd>call VSCodeNotify('editor.toggleFold')<CR>")

-- 注释
map('x', 'gc',  '<Plug>VSCodeCommentary')
map('n', 'gc',  '<Plug>VSCodeCommentary')
map('o', 'gc',  '<Plug>VSCodeCommentary')
map('n', 'gcc', '<Plug>VSCodeCommentaryLine')

vim.opt['clipboard'] = 'unnamedplus'

