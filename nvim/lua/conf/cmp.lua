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
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    -- format = function(_, vim_item)
    --   vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
    --   -- vim_item.abbr = string.sub(vim_item.abbr, 1, 60)
    --   return vim_item
    -- end
    format = function(entry, item)
      local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
      item = require("lspkind").cmp_format({
        -- any lspkind format settings here
      })(entry, item)
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      return item
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({
    --   select = true
    -- }),
    ["<CR>"] = function(fallback)
      if cmp.visible() then
        cmp.mapping.confirm({ select = true })()
      else
        fallback()
      end
    end,

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
    end, { "i", "s" })
  }),
  sources = cmp.config.sources({
    {
      name = 'luasnip',
      option = { use_show_condition = true },
      entry_filter = function()
        -- 在字符串和备注里不触发snip
        local context = require("cmp.config.context")
        local string_ctx = context.in_treesitter_capture("string") or context.in_syntax_group("String")
        local comment_ctx = context.in_treesitter_capture("comment") or context.in_syntax_group("Comment")

        --   Returning `true` will keep the entry, while returning `false` will remove it.
        return not string_ctx and not comment_ctx
      end,
    }, -- For luasnip users.
    { name = 'nvim_lsp' },
    -- { name = 'path' }
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    { name = 'lazydev', group_index = 0 }
  }, {
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
  }),
  comparators = {
    cmp.config.compare.offset,
    cmp.config.compare.exact,
    cmp.config.compare.recently_used,
  }
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline({
    ['<C-n>'] = function()
    end,
    ['<C-p>'] = function()
    end,
  }),
  sources = { {
    name = 'buffer'
  } }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
    ['<C-n>'] = function()
    end,
    ['<C-p>'] = function()
    end,
  }),
  sources = cmp.config.sources({ {
    name = 'path'
  } }, { {
    name = 'cmdline'
  } })
})
