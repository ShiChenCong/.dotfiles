require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snip" } })
local ls = require('luasnip')
ls.config.set_config({
  history = false,
  region_check_events = "InsertEnter",
  delete_check_events = "TextChanged,InsertLeave",
})
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local l = extras.l

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
    snip({
      trig = 'scc',
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, fmt([[const [{}, {}] = useState({})]], { insert(1), func(function(variable)
      print(vim.inspect(variable))
      return "set" .. 'sd'
    end), insert(3) })),
    snip("transform", {
      insert(1, "initial text"),
      text([[const [] = useState({})]]),
      -- lambda nodes accept an l._1,2,3,4,5, which in turn accept any string transformations.
      -- This list will be applied in order to the first node given in the second argument.
      l(l._1:match("[^i]*$"):gsub("i", "o"):gsub(" ", "_"):upper(), 1),
    })
  },
})
