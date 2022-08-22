require 'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "g.",
      node_incremental = "g.",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'css',
    'typescript',
    'tsx',
    'javascript',
    'html'
  }
}
