local map = require('util.map')

map('n', "<BS>", ':noh<CR>')
map('i', "<A-s>", "<Esc> :w<CR>")
map('n', "<A-s>", ":w<CR>")
map('n', "<leader>,", ":split<bar>below<bar>resize 10<bar>term<CR>")

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

map('n', 'p', 'p`]')

map('n', '{', '{zz')
map('n', '}', '}zz')

map('n', ';', ":", { silent = false })

map('n', 'c', '"0c')
-- 移动行
map('v', '<M-j>', ":m '>+1<CR>gv=gv")
map('v', '<M-k>', ":m '<-2<CR>gv=gv")
map('i', '<M-j>', '<esc>:m .+1<CR>==')
map('i', '<M-k>', '<esc>:m .-2<CR>==')
map('n', '<M-j>', ':m .+1<CR>==')
map('n', '<M-k>', ':m .-2<CR>==')

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
map('n', '<leader>co', '<Cmd>BufferLineCloseRight <CR> <Cmd>BufferLineCloseLeft<CR>')
map('n', '<leader>cr', '<Cmd>BufferLineCloseRight<CR>')
map('n', '<leader>cl', '<Cmd>BufferLineCloseLeft<CR>')
map('n', 'mr', '<Cmd>BufferLineMoveNext<CR>')
map('n', 'ml', '<Cmd>BufferLineMovePrev<CR>')
map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>")
map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>")
map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>")
map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>")
map("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<leader><TAB>", "<cmd>BufferLineCyclePrev<CR>")

-- vim-fugitive
map('n', '<leader>gp', ':Git push<CR>')
map('n', ',g', ':Git<CR>')

--diffview
map('n', '<leader>gdh', '<cmd>DiffviewFileHistory ./<CR>')
map('n', '<leader>gfh', '<cmd>DiffviewFileHistory<CR>')
map('n', '<leader>gc', "<cmd>DiffviewClose<CR>")
map('n', '<leader>gd', "<cmd>DiffviewOpen<CR>")

--telescope
map('n', '<leader>fmw', "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({theme = dropdown})<CR>")
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').git_status()<CR>")
map('n', '<leader>g', "<cmd>lua require('telescope.builtin').git_commits()<CR>")
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').git_branches()<CR>")
map('n', '<leader>fch', "<cmd>lua require('telescope.builtin').command_history()<CR>")
map('n', '<leader>fri', "<cmd>lua require('telescope.builtin').registers()<CR>")
map('n', '<leader>fo', "<cmd>lua require('telescope.builtin').oldfiles({only_cwd=true})<CR>")

--jsx-utils
map('n', ',e', 'call JSXEachAttributeInLine()<CR>')

--nvim-tree
map('n', ',f', '<cmd>NvimTreeToggle<CR>')
vim.api.nvim_set_keymap('n', ',c', '<cmd>NvimTreeFindFile<CR> zz', { noremap = true, silent = true })

--toggleterm
map('n', ',t', ":ToggleTermToggleAll<CR>")
