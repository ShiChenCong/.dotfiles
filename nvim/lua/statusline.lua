-- vim.opt.statusline = [[  %< %{FugitiveHead()}  %f %m %r %w  %= Ln %l, Col %c  %{&fileencoding?&fileencoding:&filetype}  ]]
-- local reset_group = vim.api.nvim_create_augroup('reset_group', {
--   clear = false,
-- })

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold' }, {
--   callback = function()
--     local branch = vim.fn.system "git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'"
--     if #branch > 0 then
--       vim.b.branch_name = '  ' .. branch .. ' '
--     else
--       vim.b.branch_name = ''
--     end
--
--     local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
--     local num_warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
--     if num_warnings > 0 and num_errors == 0 then
--       vim.b.errors = '  ' .. num_warnings .. ' '
--     end
--     if num_errors > 0 and num_warnings == 0 then
--       vim.b.errors = '  ' .. num_errors .. ' '
--     end
--     if num_errors > 0 and num_warnings > 0 then
--       vim.b.errors = '  ' .. num_warnings .. ' ' .. '  ' .. num_errors .. ' '
--     end
--
--     if (num_warnings == 0 and num_errors == 0) then
--       vim.b.errors = ''
--     end
--   end,
--   group = reset_group,
-- })

vim.cmd [[hi User1 ctermfg=007 ctermbg=239 guibg=#073642 guifg=#93a1a1 ]]
-- vim.opt.statusline = [[ %1*  %< %{get(b:, "branch_name", "")}  %f %m %r %w  %= Ln %l, Col %c %#CursorColumn# %{get(b:, "errors", "")}  %{&fileencoding?&fileencoding:&filetype}  ]]
vim.opt.statusline = [[ %1*  %< %{get(b:, "branch_name", "")}  %f %m %r %w  %= Ln %l, Col %c %3p%% %{&fileencoding?&fileencoding:&filetype}  ]]
