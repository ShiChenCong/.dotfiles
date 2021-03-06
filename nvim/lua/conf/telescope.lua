local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local action_layout = require("telescope.actions.layout")
local map = require('util/map')
require('telescope').setup {
  defaults = {
    -- path_display = { shorten = { len = 2, exclude = { 4, 5, 6, 7, 8, 9 } } },
    -- prompt_prefix = "",
    file_ignore_patterns = { "node_modules" },
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
        ["<c-q>"] = trouble.open_selected_with_trouble,
        ['<c-;>'] = action_layout.toggle_preview
      }
    },
    -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
  pickers = {
    -- live_grep = { theme = "dropdown", shorten = { len = 2 } },
    -- find_files = { theme = "dropdown" }
    find_files = { previewer = false },
    oldfiles = { previewer = false }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor {}
    }
  },
}

local telescope_find_word_in_specifeid_file = function(path)
  local handledPath = path or vim.fn['defx#get_candidate']().action__path
  require("telescope.builtin").live_grep({ search_dirs = { handledPath }, file_ignore_patterns = {} })
end

local telescope_find_word = function()
  local word = vim.fn.input("Search > ")
  local len = #word
  if len ~= 0 then
    if word:find('-w') then
      local handled_word = string.gmatch(word, "%S+")
      require('telescope.builtin').grep_string({ search = handled_word(), word_match = '-w' })
    else
      require('telescope.builtin').grep_string({ search = word })
    end
  end
end

map('n', '<leader>fd', telescope_find_word_in_specifeid_file)
map('n', '<leader>fw', telescope_find_word)
