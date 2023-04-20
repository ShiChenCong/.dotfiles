local actions = require("telescope.actions")
local pickers = require "telescope.pickers"
local conf = require("telescope.config").values
local trouble = require("trouble.providers.telescope")
local finders = require "telescope.finders"
local action_layout = require("telescope.actions.layout")
local get_icon = require 'nvim-web-devicons'.get_icon
local entry_display = require "telescope.pickers.entry_display"
local make_entry = require "telescope.make_entry"
local map = require('util/map')

local opts = {
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
        ['<C-u>'] = false,
        ["<esc>"] = actions.close,
        ["<a-q>"] = trouble.open_selected_with_trouble,
        ['<A-p>'] = action_layout.toggle_preview,
        ["<c-e>"] = actions.to_fuzzy_refine
        -- ['<C-j>'] = actions.move_selection_next,
        -- ['<C-k>'] = actions.move_selection_previous,
      }
    },
    -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
  pickers = {
    -- live_grep = { theme = "dropdown", shorten = { len = 2 } },
    -- find_files = { theme = "dropdown" }
    find_files = { previewer = false },
    git_files = { previewer = false },
    oldfiles = { previewer = false }
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor {}
    }
  },
}

require('telescope').setup(opts)

local M = {}

M.telescope_find_word_in_specifeid_file = function(path)
  local handledPath = path or vim.fn['defx#get_candidate']().action__path
  require("telescope.builtin").live_grep({ search_dirs = { handledPath }, file_ignore_patterns = {} })
end

--[[ local function search_result_file_once(word)
  local handled_word = string.gmatch(word, "%S+")
  local results = vim.fn.systemlist("rg " .. handled_word() .. " -l")

  pickers.new({}, {
    prompt_title = "Result",
    finder = finders.new_table {
      results = results,
      entry_maker = make_entry.gen_from_file(opts)
    },
    previewer = conf.file_previewer(opts)
  }):find()
end ]]
local function telescope_find_word()
  local word = vim.fn.input("Search > ")
  local len = #word
  if len ~= 0 then
    if string.find(word, "%s") then
      local pattern = "(%S+)%s+(.*)"
      local handleWord, additional_args = string.match(word, pattern)
      local arg_table = {}
      for arg in string.gmatch(additional_args, "%S+") do
        table.insert(arg_table, arg)
      end
      require('telescope.builtin').grep_string({ search = handleWord, additional_args = arg_table })
    else
      require('telescope.builtin').grep_string({ search = word })
    end
  end
end

map('n', '<leader>fd', M.telescope_find_word_in_specifeid_file)
map('n', '<leader>fw', telescope_find_word)

return M
