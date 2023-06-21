-- Lua
local actions = require("diffview.actions")
require("diffview").setup({
  show_help_hints = false,
  keymaps = {
    disable_defaults = false,                -- Disable the default keymaps
    view = {
      ["gf"] = actions.goto_file_edit,       -- Open the file in a new split in the previous tabpage
    },
    file_panel = {
    },
    file_history_panel = {
    },
    option_panel = {
      ["<tab>"] = actions.select_entry,
      ["q"]     = actions.close,
    },
  },
  file_history_panel = {
    win_config = {
      height = 10
    }
  }
})
