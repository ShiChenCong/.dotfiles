require('Comment').setup({
  -- pre_hook = function(ctx)
  --   return require('ts_context_commentstring.internal').calculate_commentstring()
  -- end,
  pre_hook = function(ctx)
    return require('Comment.jsx').calculate(ctx)
  end,
})
