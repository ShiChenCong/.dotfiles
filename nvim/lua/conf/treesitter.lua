require 'nvim-treesitter.configs'.setup {
  indent = {
    enable = true,
    disable = { 'rust' },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "g.",
      node_incremental = "g.",
      -- scope_incremental = "grc",
      -- node_decremental = "grm",
    },
  },
  -- 配合nvim-ts-context-commentstring插件
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    -- enable = true,
    -- disable = function(lang, buf)
    --   local max_filesize = 100 * 1024 -- 100 KB
    --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --   if ok and stats and stats.size > max_filesize then
    --     return true
    --   end
    -- end,
  },
  ensure_installed = {
    'css',
    'typescript',
    'tsx',
    'javascript',
    'html',
    'lua',
    'json',
    'rust'
  }
}

local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.less = "scss" -- the someft filetype will use the python parser and queries.
