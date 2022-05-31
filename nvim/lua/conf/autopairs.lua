require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
})

-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- put this to setup function and press <a-e> to use fast_wrap
local npairs = require("nvim-autopairs")
npairs.setup({
  fast_wrap = {},
})

-- change default fast_wrap
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
