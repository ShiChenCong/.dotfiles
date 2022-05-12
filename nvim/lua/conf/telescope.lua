local actions = require("telescope.actions")
require('telescope').setup{
	defaults = {
     -- prompt_prefix = "",
     file_ignore_patterns = {"node_modules"},
     sorting_strategy = "ascending",
     layout_config = {
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.5,
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
      },
    ["ui-select"] = {
      require("telescope.themes").get_cursor {
        -- even more opts
      }
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
   },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('vim_bookmarks')
require("telescope").load_extension("ui-select")

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function telescope_find_word_in_specifeid_file(path)
  vim.api.nvim_command("call defx#call_action('yank_path')")
  local _path = vim.fn.eval('@*')
  -- local _path = path or vim.fn.input("Dir: ", "", "dir")
  require("telescope.builtin").live_grep({search_dirs = {_path},file_ignore_patterns={}})
end

function telescope_find_word()
  local word = vim.fn.input("Search > ")
  local len = #word
  if len ~= 0 then
      require('telescope.builtin').grep_string({ search = word })
  end
end
map('n', '<leader>fd', ':lua telescope_find_word_in_specifeid_file()<CR>')
-- map('n', '<leader>.', ':Telescope lsp_code_actions theme=cursor<CR>')
map('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>fw', ':lua telescope_find_word()<CR>')
