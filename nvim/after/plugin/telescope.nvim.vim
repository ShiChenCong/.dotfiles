lua << EOF
local actions = require("telescope.actions")
require('telescope').setup{
	defaults = {
     prompt_prefix = "",
     file_ignore_patterns = {"node_modules"},
     sorting_strategy = "ascending",
     layout_config = {
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
     vertical = {
        width_padding = 0.05,
        height_padding = 1,
        peview_height = 0.5,
      },
     },
    mappings = {
        i = {
            ["<esc>"] = actions.close,
        },
    },
    -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
     vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-F',
      '-w'
      }
  },
	pickers = {
     -- live_grep ={ theme= "dropdown"  },
     -- find_files={ theme= "dropdown"  }
	},
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
      }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('vim_bookmarks')
local function map(mode, lhs, rhs, opts)
local options = {noremap = true}
if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function telescope_find_word(path)
  local _path = path or vim.fn.input("Dir: ", "", "dir")
  require("telescope.builtin").live_grep({search_dirs = {_path}})
end
map('n', '<leader>fd', ':lua telescope_find_word()<CR>')
EOF

