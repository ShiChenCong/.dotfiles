local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

-- local function replace_keys(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

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
  Field = '  ',
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
  EnumMember = '  ',
  Constant = " ",
  Struct = "פּ  ",
  Event = " ",
  Operator = " ",
  TypeParameter = " "
}

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
      return vim_item
    end
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' })
  },
  sources = cmp.config.sources({ {
    name = 'nvim_lsp'
  }, {
    name = 'vsnip'
  } }, { {
    name = 'buffer'
  } })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { {
    name = 'buffer'
  } }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ {
    name = 'path'
  } }, { {
    name = 'cmdline'
  } })
})

vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
vim.cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vim.cmd("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")
vim.cmd("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
vim.cmd("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0")
vim.cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
vim.cmd("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4")
vim.cmd("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4")
