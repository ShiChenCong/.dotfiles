require('gitsigns').setup {
  current_line_blame = true,
   current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 400,
    ignore_whitespace = true,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or { silent = true }
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function()
        gs.next_hunk()
        vim.cmd [[normal zz]]
      end)
      return '<Ignore>'
    end, { expr = true, silent = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function()
        gs.prev_hunk()
        vim.cmd [[normal zz]]
      end)
      return '<Ignore>'
    end, { expr = true, silent = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', ',b', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,
}

-- vim.cmd("hi GitSignsCurrentLineBlame guifg=#4e5362")
