require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snip" } })
local ls = require('luasnip')
ls.config.set_config({
  history = false,
  region_check_events = "InsertEnter",
  delete_check_events = "TextChanged,InsertLeave",
})

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix


function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

local function fn(
      args, -- text from i(2) in this example i.e. { { "456" } }
      parent, -- parent snippet or parent node
      user_args -- user_args from opts.user_args
)
  return user_args .. firstToUpper(args[1][1])
end

ls.add_snippets(nil, {
  all = {
    s("us", {
      t 'const [', i(1),
      t ',',
      f(fn, -- callback (args, parent, user_args) -> string
        { 1 }, -- node indice(s) whose text is passed to fn, i.e. i(2)
        { user_args = { "set" } }-- opts
      ),
      t '] = useState(',
      i(2),
      t ')'
    })
  },
})
