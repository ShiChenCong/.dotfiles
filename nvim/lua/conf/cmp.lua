local ok, cmp = pcall(require, 'cmp')
local luasnip = require("luasnip")
local lspkind = require('lspkind')
if not ok then
  return
end
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
cmp.setup({
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  formatting = {
    -- format = function(_, vim_item)
    --   vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
    --   -- vim_item.abbr = string.sub(vim_item.abbr, 1, 60)
    --   return vim_item
    -- end
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function(entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true
    }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }) }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
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

-- ??????oneDark???????????????
-- vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
-- vim.cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
-- vim.cmd("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")
-- vim.cmd("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
-- vim.cmd("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE")
-- vim.cmd("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE")
-- vim.cmd("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
-- vim.cmd("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0")
-- vim.cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
-- vim.cmd("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4")
-- vim.cmd("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4")
