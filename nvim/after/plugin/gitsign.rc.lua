require('gitsigns').setup {
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
    ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
    ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
    ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
    ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',
    ['n <leader>bl'] = '<cmd>Gitsigns toggle_current_line_blame<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
 
vim.cmd("hi GitSignsCurrentLineBlame guifg=#4e5362")
vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
vim.cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vim.cmd("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")
vim.cmd("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
vim.cmd("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0")
vim.cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
vim.cmd("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4")
vim.cmd("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4")
