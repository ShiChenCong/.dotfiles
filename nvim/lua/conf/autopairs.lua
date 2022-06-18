local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

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
