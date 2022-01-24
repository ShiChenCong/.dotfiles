lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

--  local cmp_kinds = {
--    Text = '  ',
--    Method = '  ',
--    Function = ' ',
--    Constructor = '  ',
--    Field = '  ',
--    Variable = '  ',
--    Class = '  ',
--    Interface = '  ',
--    Module = '  ',
--    Property = '  ',
--    Unit = '  ',
--    Value = '  ',
--    Enum = '  ',
--    Keyword = '  ',
--    Snippet = '  ',
--    Color = '  ',
--    File = '  ',
--    Reference = '  ',
--    Folder = '  ',
--    EnumMember = '  ',
--    Constant = '  ',
--    Struct = '  ',
--    Event = '  ',
--    Operator = '  ',
--    TypeParameter = '  ',
--  }
 local cmp_kinds = {
      Text = " ",
      Method = " ",
      Function = " ",
      Constructor = " ",
      Field = "ﰠ ",
      Variable = " ",
      Class = "ﴯ ",
      Interface = " ",
      Module = " ",
      Property = "ﰠ ",
      Unit = "塞 ",
      Value = " ",
      Enum = " ",
      Keyword = " ",
      Snippet = " ",
      Color = " ",
      File = " ",
      Reference = " ",
      Folder = " ",
      EnumMember = " ",
      Constant = " ",
      Struct = "פּ  ",
      Event = " ",
      Operator = " ",
      TypeParameter = " "
  }
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    formatting = {
      format = function(_, vim_item)
        vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
        return vim_item
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF
