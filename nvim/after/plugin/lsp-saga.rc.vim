if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "<Esc>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "<Esc>",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<Esc>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
}

-- local saga = require 'lspsaga'
-- saga.init_lsp_saga {
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',
--   border_style = "round",
--   code_action_keys = {
--     quit = '<Esc>',
--     exec = '<CR>'
--   },
--   rename_action_keys = {
--     quit = '<Esc>',exec = '<CR>'
--   },
-- }
EOF
" nnoremap <silent><leader>. <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>l :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [d :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> ]d :Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent><leader>pr <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

