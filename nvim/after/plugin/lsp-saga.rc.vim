if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = ' ',
  warn_sign = ' ',
  hint_sign = '',
  infor_sign = ' ',
  border_style = "round",
  code_action_keys = {
    quit = '<Esc>',
    exec = '<CR>'
  },
  rename_action_keys = {
    quit = '<Esc>',exec = '<CR>'
  },
}
EOF
nnoremap <silent><M-Enter> <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent><leader>. <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>l :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent><leader>pr <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

