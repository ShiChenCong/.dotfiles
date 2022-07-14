local map = require('util.map')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

map('n', 'gq', ":q<CR>")
map('n', 'mt', '%')
map('v', 'mt', '%')
map('n', ',r', ":LspRestart<CR>")
-- map('i', ';w<CR>', '<Esc>')
-- map('n', 'j', "<Plug>(accelerated_jk_gj)")
-- map('n', 'k', "<Plug>(accelerated_jk_gk)")
map('n', 'yw', 'yiw')
map('n', 'dw', 'diw')
map('n', 'cw', 'ciw')

map('n', ',t', ':tabnew<CR>')
map('n', 'tn', ':tabnext<CR>')
map('n', 'tp', ':tabprevious<CR>')
map('n', 'tc', ':tabclose<CR>')
map('n', 'to', ':tabonly<CR>')

map('n', '<leader>e', ':Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR> :noh<CR>')
map('t', '<Esc>', '<C-\\><C-n>')

map('n', 'mw', '*')
-- map('n', 'mw', ':keepjumps normal! mi*`i<CR>')

map('n', '<C-;>', 'u')

map('i', '<C-o>', '<Esc>ddO')
map('i', '<C-d>', '<Esc>yypi')

map('n', "<BS>", ':noh<CR>')
map('i', "<A-s>", "<Esc> :w<CR>")
map('n', "<A-s>", ":w<CR>")
map('n', "<leader>,", ":split<bar>below<bar>resize 10<bar>term<CR>")
map('n', '[[', "<Cmd>call search('[([{<]')<CR>")

map('n', '<leader><M-j>', ':resize +3<CR>')
map('n', '<leader><M-k>', ":resize -2<CR>")
map('n', '<leader><M-h>', ":vertical resize +2<CR>")
map('n', '<leader><M-l>', ":vertical resize -2<CR>")

map('v', "<", "<gv")
map('v', ">", ">gv")

map('n', '<A-f>', ":let @+ = fnamemodify(expand('%'), ':~:.')<CR>")

map('n', "sh", '<C-w>h')
map('n', "sj", '<C-w>j')
map('n', "sk", '<C-w>k')
map('n', "sl", '<C-w>l')

map('v', 'L', "$")
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
map('v', '<M-j>', ":m '>+1<CR>gv=gv")
map('v', '<M-k>', ":m '<-2<CR>gv=gv")
map('i', '<M-j>', '<esc>:m .+1<CR>==')
map('i', '<M-k>', '<esc>:m .-2<CR>==')
map('n', '<M-j>', ':m .+1<CR>==')
map('n', '<M-k>', ':m .-2<CR>==')

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
  local bufferLen = vim.api.nvim_exec("echo len(getbufinfo({'buflisted':1}))", true)
  if (len > 1) then
    if (bufferLen == "1") then
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
-- 关闭当前window
map('n', ',q', ":q<CR>")

-- BufferLine
map('n', '<leader>co', '<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>')
map('n', '<leader>cr', '<Cmd>BufferLineCloseRight<CR>')
map('n', '<leader>cl', '<Cmd>BufferLineCloseLeft<CR>')
-- map('n', 'c;', '<cmd>BufferCloseAllButPinned<CR>')
map('n', 'mr', '<Cmd>BufferLineMoveNext<CR>')
map('n', 'ml', '<Cmd>BufferLineMovePrev<CR>')
map("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<leader><TAB>", "<cmd>BufferLineCyclePrev<CR>")
map('n', '<leader>;', "<cmd>BufferLineTogglePin<CR>")
map('n', 'c;', "<cmd>BufferLineGroupClose ungrouped<CR>")
-- map('n', '<leader>;', "<Cmd>BufferPin<CR>", { nowait = true })

-- vim-fugitive
map('n', '<leader>gp', ':Git push<CR>')
map('n', ',g', ':Git<CR>')
map('n', '<leader>gr', ":diffget //3<CR>")
map('n', '<leader>gl', ":diffget //2<CR>")
map('n', ',b', ':Git blame<CR>')

--diffview
map('n', '<leader>gh', '<cmd>DiffviewFileHistory ./<CR>')
map('n', '<leader>gf', '<cmd>DiffviewFileHistory %<CR>')
map('n', '<leader>gc', "<cmd>DiffviewClose<CR>")
map('n', '<leader>gd', "<cmd>DiffviewOpen<CR>")

--telescope
map('n', '<leader>fmw', "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
-- map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({theme = dropdown})<CR>")
map('n', '<leader>ff', "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>")
map('n', '<leader>fg', "<cmd>Telescope git_status<CR>")
map('n', '<leader>g', "<cmd>Telescope git_commits<CR>")
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').git_branches()<CR>")
map('n', '<leader>fch', "<cmd>lua require('telescope.builtin').command_history()<CR>")
map('n', '<leader>fi', "<cmd>lua require('telescope.builtin').registers()<CR>")
map('n', '<leader>fo', "<cmd>Telescope oldfiles only_cwd=true<CR>")

--jsx-utils
map('n', ',e', 'call JSXEachAttributeInLine()<CR>')

--nvim-tree
map('n', ',f', '<cmd>NvimTreeToggle<CR>')
-- 配合preview
-- map('n', '<CR>', ':lua vim.bo.bufhidden = ""<CR>')
vim.api.nvim_set_keymap('n', ',c', '<cmd>NvimTreeFindFile<CR> zz', { noremap = true, silent = true })

--toggleterm
-- map('n', ',t', ":ToggleTermToggleAll<CR>")

--surround
map('n', "<leader>'", '<Plug>Ysurroundiw\""')
map('n', '<leader>[', '<Plug>Ysurroundiw]"')
map('n', '<leader>{', '<Plug>Ysurroundiw{"')
map('n', '<leader>(', '<Plug>Ysurroundiw("')

--bqf
map('n', '<leader>p', "<cmd>BqfToggle<CR>")

--mutli cursor
map('n', '<C-LeftMouse>', "<Plug>(VM-Mouse-Cursor)")
map('n', '<C-RightMouse>', "<Plug>(VM-Mouse-Word)")
map('n', '<M-C-RightMouse>', "<Plug>(VM-Mouse-Column)")

-- 跳转也能加到jumplist
-- vim.cmd [[
--   nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
--   nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
-- ]]

vim.cmd [[
let @i = 'ceimportf=cf(from f)x'
nnoremap <leader>cri :global/require/normal @i<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
echo "@".getcmdline()
execute ":'<,'>normal @".nr2char(getchar())
endfunction
]]
