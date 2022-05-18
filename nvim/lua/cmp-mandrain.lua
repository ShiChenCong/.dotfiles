local source = {}

function source:is_available()
  return true
end

function source:get_debug_name()
  return 'debug_name'
end

function source:get_keyword_pattern()
  return [[\w\+]]
end

function source:get_trigger_characters()
  return { '.' }
end

function source:complete(request, callback)
  local word = string.sub(request.context.cursor_before_line, request.offset)
  local items = vim.tbl_map(function(w)
    return {
      -- 选中后输出的字符串
      word = '施晨聪',
      -- 显示在popmenu里
      label = w .. 'suffix' .. word,
      -- 显示在label的后面
      labelDetails = {
        detail = 'sdfdf',
      },
      -- 显示在详情弹框里
      detail = '拼音' .. word,
      -- 类型1是Text
      kind = 1
    }
  end, { 'zq' })

  callback(items)
end

function source:resolve(completion_item, callback)
  callback(completion_item)
end

function source:execute(completion_item, callback)
  callback(completion_item)
end

source.new = function()
  local self = setmetatable({}, { __index = source })
  return self
end

require('cmp').register_source('month', source.new())
