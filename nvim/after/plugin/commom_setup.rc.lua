require('Comment').setup({
    pre_hook = function(ctx)
      return require('ts_context_commentstring.internal').calculate_commentstring()
    end,
})
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}
require('onedark').setup({
  dark_float = true
})
local utils = require("onedark.util")
vim.defer_fn(function()
     utils.syntax({
       Folded = { bg = "#2d3139" }
     })
 end, 101)


local status, bqf = pcall(require, "bqf")
if (not status) then return end
require('bqf').setup({
  auto_enable = false,
})
