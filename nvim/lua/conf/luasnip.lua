require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snip" } })
local ls = require('luasnip')
ls.config.set_config({
  region_check_events = "InsertEnter",
  delete_check_events = "TextChanged,InsertLeave",
})

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


local firstToUpper = function(str)
  return (str:gsub("^%l", string.upper))
end

local function fn(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent,   -- parent snippet or parent node
  user_args -- user_args from opts.user_args
)
  return user_args .. firstToUpper(args[1][1])
end

ls.add_snippets(nil, {
  html = {
    s("html", fmt([[
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Document</title>
        </head>

        <body>
          {}
        </body>

        </html>
    ]], { i(0) }))
  }
})


local js_doc_snip = s("/**", fmt([[ /** {} */ ]], { i(0) }))
local use_state_snip = s("us", {
  t 'const [', i(1),
  t ', ',
  f(fn,                       -- callback (args, parent, user_args) -> string
    { 1 },                    -- node indice(s) whose text is passed to fn, i.e. i(2)
    { user_args = { "set" } } -- opts
  ),
  t '] = useState(',
  i(2),
  t ')'
})
local log_snip = s("l", fmt([[ console.log({}) ]], { i(0) }))
local class_name_snip = s("cc", fmt([[ className="{}"]], { i(0) }))
local log_with_prefix_snip = s("ll", { t 'console.log(', f(function()
  local value = vim.fn.getreg('"');
  local success, result = pcall(function()
    return "\'" .. value .. " is: \', " .. value
  end)
  if success then
    return result
  else
    return ""
  end
end), t ')' })

local frontend_file = {
  "javascript", "javascriptreact", "typescript", "typescriptreact"
}
for _, value in ipairs(frontend_file) do
  ls.add_snippets(value, {
    log_snip,
    use_state_snip,
    log_with_prefix_snip,
    js_doc_snip,
    class_name_snip
  })
end
--[[ -- 回调
vim.api.nvim_create_autocmd("User", {
  pattern = "LuasnipPreExpand",
  callback = function()
    print(123)
  end
}) ]]
