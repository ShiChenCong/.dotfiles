local map           = require('util.map')
local keep_position = require('util.keep_position')
local is_git        = require('util.is_git')
local get_listed_buf_count = require('util.util').get_listed_buf_count

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')
map('n', "<C-d>", '<C-d>zz')
map('n', "<C-u>", '<C-u>zz')
map('n', '<A-z>', 'u')

-- 使用 *的时候不要自动跳到下一个
map('n', '*', "*``")

-- 为了让c-i映射生效 配合kitty里的配置
map('n', '<C-i>', '<C-i>')

map('n', ',w', ':w<CR>', { silent = true })
map('n', ',q', ':q<CR>', { silent = true })
-- map('n', '<cr>', '"_ciw')

-- 宏
-- map('n', 'Q', 'q')
-- map('n', 'q', '<Nop>')

map('n', ',u', function()
  keep_position.stay_position(function()
    vim.cmd [[u]]
  end)
end)

-- map('n', '<C-r>', function()
--   keep_position.stay_position(function()
--     vim.cmd('redo')
--   end)
-- end)


map('n', 'g;', 'g;')

map('n', 'gq', ":q<CR>")
map('n', 'mt', '%')
map('v', 'mt', '%')
map('n', ',r', ":LiveServer start<CR>")

map('n', 'yw', 'yiw')
map('n', 'dw', 'diw')
map('n', 'cw', 'ciw')
map('n', '<A-/>', function()
  local word = vim.fn.input("Search > ")
  if word ~= nil and #word ~= 0 then
    vim.fn.setreg('/', word)
    vim.cmd('set hlsearch')
    vim.cmd('normal n')
  end
end)

map('n', ',t', function()
  keep_position.stay_position(function()
    local file_path = vim.api.nvim_buf_get_name(0);
    vim.cmd [[tabnew]]
    vim.cmd('e ' .. file_path)
  end)
end)
map('n', 'tn', ':tabnext<CR>')
map('n', 'tp', ':tabprevious<CR>')
map('n', 'tc', ':tabclose<CR>')
map('n', 'to', ':tabonly<CR>')

map('n', '<leader>e', ':Explore <bar> :sil! /<C-R>=expand("%:t")<CR><CR> :noh<CR> <Left><Left>')
map('t', '<Esc>', '<C-\\><C-n>')

map('n', 'mm', function()
  local line = vim.fn.getline('.')
  local col = vim.fn.col('.')
  local l = line:sub(col, col)
  if l == '[' or l == ']' or l == '{' or l == '}' or l == '(' or l == ')' then
    vim.cmd.normal('%')
  else
    vim.cmd.normal('*')
  end
end)

map('n', '<C-;>', 'u')
map('n', '<C-,>', 'u')
map('n', ',f', ":let @+ = fnamemodify(expand('%'), ':~:.')<CR>")

map('i', '<C-o>', '<Esc>ddO')
map('i', '<C-d>', function()
  vim.api.nvim_input('<Esc>')
  vim.cmd.normal('"0yy')
  vim.cmd.normal('"0p')
  vim.api.nvim_input('i')
end)

map('n', "<BS>", ':noh<CR>')
map('i', "<A-s>", "<Esc> :w<CR>")
-- map('i', ";w", "<Esc>:w<cr>")
map('n', "<A-s>", ":w<CR>")
map('n', "<leader>,", ":split<bar>below<bar>resize 10<bar>term<CR>")
map('n', '[[', "<Cmd>call search('[([{<]')<CR>")

map('n', '<leader><M-j>', ':resize +3<CR>')
map('n', '<leader><M-k>', ":resize -2<CR>")
map('n', '<leader><M-h>', ":vertical resize +2<CR>")
map('n', '<leader><M-l>', ":vertical resize -2<CR>")

map('v', "<", "<gv")
map('v', ">", ">gv")


-- map('n', "sh", '<C-w>h')
-- map('n', "sj", '<C-w>j')
-- map('n', "sk", '<C-w>k')
-- map('n', "sl", '<C-w>l')

map('v', 'L', "$<Left>")
map('n', 'L', "$")

map('n', "H", "^")
map('v', "H", "^")

-- 前进光标记录newer
map('n', "si", "<C-i>")
-- 后退光标记录older
map('n', "so", "<C-o>")

map('n', "ss", ":split<CR>")
map('n', "sv", ":vsplit<CR>")

map('n', '{', '{zz')
map('n', '}', '}zz')

map('n', ';', ":", { silent = false })

map('n', 'dp', function()
  local count = get_listed_buf_count()
  if count > 1 then
    vim.cmd("bprevious | bdelete")
  end
end)


--ciw不会yank改变的单词
map('n', 'c', '"_c')
map('x', 'c', '"_c')
-- map('n', 'C', '"_c')

map('n', 'p', 'p=`]')
-- 覆盖选中的部门 不会yank
map('v', 'p', '"_dP')

-- 对选中的区块执行.
map('v', '.', ':norm .<CR>')

-- 移动行
map('v', 'sj', ":m '>+1<CR>gv=gv")
map('v', 'sk', ":m '<-2<CR>gv=gv")
-- map('i', '<M-j>', '<esc>:m .+1<CR>==')
-- map('i', '<M-k>', '<esc>:m .-2<CR>==')
map('n', 'sj', ':m .+1<CR>==')
map('n', 'sk', ':m .-2<CR>==')

map('n', 'dw', 'vb"_d')
map('n', '<C-a>', 'gg<S-v>G')

-- terminal move
map('n', '<C-h>', '<C-\\><C-N><C-h>')
map('n', '<C-l>', '<C-\\><C-N><C-l>')
map('n', '<C-j>', '<C-\\><C-N><C-j>')
map('n', '<C-k>', '<C-\\><C-N><C-k>')

-- 关闭当前
map('n', ',d', function()
  local len = #vim.api.nvim_list_wins()
  -- local bufferLen = vim.api.nvim_exec("echo len(getbufinfo({'buflisted':1}))", true)
  local bufferLen = get_listed_buf_count()
  if (len > 1) then
    if (bufferLen == 1) then
      vim.cmd("q")
      -- 配合nvim-tree的preview
    elseif (vim.bo.bufhidden == 'delete') then
      local isNvimtreeOpen = require 'nvim-tree.view'.is_visible()
      if isNvimtreeOpen then
        vim.cmd('NvimTreeClose')
        vim.cmd("bd!")
        vim.cmd('NvimTreeOpen')
      else
        vim.cmd("bd!")
      end
    else
      vim.cmd("b#|bd#")
    end
  else
    vim.cmd('bd!')
    -- vim.cmd('b#')
    -- vim.cmd("bd#")
  end
end)

-- BufferLine
map('n', 'co', function()
  local curBufnr = vim.api.nvim_get_current_buf();
  local bufs = vim.fn.getbufinfo({ buflisted = 1, hidden = false });
  if #bufs == 1 then
    return
  end
  -- local ids = 'bd'
  for _, value in pairs(bufs) do
    if value.bufnr ~= curBufnr then
      vim.cmd('bd ' .. value.bufnr)
      -- ids = ids .. ' ' .. value.bufnr;
    end
  end
  -- print(ids)
  -- vim.cmd(ids)
  vim.cmd('lua vim.o.tabline = "%!v:lua.nvim_bufferline()"')
end)
-- map('n', '<leader>co', ':BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>', { noremap = true, silent = false })
map('n', 'cr', ':BufferLineCloseRight<CR>', { noremap = true, silent = false })
map('n', 'cl', ':BufferLineCloseLeft<CR>', { noremap = true, silent = false })
-- map('n', 'c;', '<cmd>BufferCloseAllButPinned<CR>')
map('n', 'mr', '<Cmd>BufferLineMoveNext<CR>')
map('n', 'ml', '<Cmd>BufferLineMovePrev<CR>')
map("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<leader><TAB>", "<cmd>BufferLineCyclePrev<CR>")
-- map('n', '<leader>;', "<cmd>BufferLineTogglePin<CR>")
-- map('n', 'c;', "<cmd>BufferLineGroupClose ungrouped<CR>")
-- map('n', '<leader>;', "<Cmd>BufferPin<CR>", { nowait = true })

-- vim-fugitive
map('n', '<leader>gp', ':Git push<CR>')
map('n', ',g', function()
  if is_git.is_git_dir() then
    vim.cmd('Git')
  end
end)
map('n', '<leader>gr', ":diffget //3<CR>")
map('n', '<leader>gl', ":diffget //2<CR>")
-- map('n', ',b', ':Git blame<CR>')

--diffview
map('n', '<leader>gh', '<cmd>DiffviewFileHistory<CR>')
map('n', '<leader>gf', '<cmd>DiffviewFileHistory %<CR>')
map('n', '<leader>gc', "<cmd>DiffviewClose<CR>")
map('n', '<leader>gd', "<cmd>DiffviewOpen<CR>")

--telescope
map('n', '<leader>fm', "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
-- map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({theme = dropdown})<CR>")
-- map('n', '<leader>ff', "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>")
map('n', '<leader>ff', function()
  if is_git.is_git_dir() then
    vim.cmd("Telescope git_files use_git_root=false find_command=rg,--ignore,--hidden,--files")
  else
    vim.cmd("Telescope find_files find_command=rg,--ignore,--hidden,--files")
  end
end)
map('n', '<leader>fg', "<cmd>Telescope git_status<CR>")
map('n', '<leader>g', "<cmd>Telescope git_commits<CR>")
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').git_branches()<CR>")
map('n', '<leader>fch', "<cmd>lua require('telescope.builtin').command_history()<CR>")
map('n', '<leader>fi', "<cmd>lua require('telescope.builtin').registers()<CR>")
map('n', '<leader>fo', "<cmd>Telescope oldfiles only_cwd=true<CR>")

--nvim-tree
map('n', '<A-f>', '<cmd>NvimTreeToggle<CR>')
-- 配合preview
-- map('n', '<CR>', ':lua vim.bo.bufhidden = ""<CR>')
vim.api.nvim_set_keymap('n', ',c', '<cmd>NvimTreeFindFile<CR> zz', { noremap = true, silent = true })

--toggleterm
-- map('n', ',t', ":ToggleTermToggleAll<CR>")

--surround
map('n', "<leader>'", "ysiw'", { remap = true })
map('n', '<leader>"', 'ysiw"', { remap = true })
map('n', '<leader>[', 'ysiw[', { remap = true })
map('n', '<leader>{', 'ysiw{', { remap = true })
map('n', '<leader>(', 'ysiw(', { remap = true })

--bqf
map('n', '<leader>p', "<cmd>BqfToggle<CR>")

--mutli cursor
map('n', '<C-LeftMouse>', "<Plug>(VM-Mouse-Cursor)")
map('n', '<C-RightMouse>', "<Plug>(VM-Mouse-Word)")
map('n', '<M-C-RightMouse>', "<Plug>(VM-Mouse-Column)")

-- 为了更好的undo
vim.cmd [[
  inoremap <Space> <C-g>u<Space>
  inoremap <C-W> <C-G>u<C-W>
  inoremap <C-U> <C-G>u<C-U>
  inoremap . <c-g>u.
  inoremap : <c-g>u:
  inoremap ; <c-g>u;
  inoremap ! <c-g>u!
  inoremap ? <c-g>u?
  inoremap , <c-g>u,
]]

-- leap map
map({ 'x', 'o', 'n' }, 'q', '<Plug>(leap-forward-to)')
map({ 'x', 'o', 'n' }, 'Q', '<Plug>(leap-backward-to)')
