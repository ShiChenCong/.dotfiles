local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local handlers = require('nvim-autopairs.completion.handlers')
local cmp = require('cmp')
local keymap = require("cmp.utils.keymap")

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
  filetypes = {
    ["*"] = {
      ["("] = {
        kind = {
          cmp.lsp.CompletionItemKind.Function,
          cmp.lsp.CompletionItemKind.Method,
        },
        handler = handlers["*"]
      }
    },
    typescriptreact = {
      ["("] = {
        kind = {
          cmp.lsp.CompletionItemKind.Function,
          cmp.lsp.CompletionItemKind.Method
        },
        handler = function(char, item, bufnr)
          -- 大写字母则是React组件 不要自动添加括号
          if string.match(item.insertText, '^%u') == nil then
            vim.api.nvim_feedkeys(keymap.t("()<Left>"), "n", true)
          end
        end
      }
    },
  }
}))

local npairs = require("nvim-autopairs")
npairs.setup({
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt" },
})

npairs.setup({
  fast_wrap = {
    map = '<C-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment'
  },
})
