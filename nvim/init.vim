source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/setting.vim

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

" filetype plugin indent on
call plug#begin('~/.config/nvim/plugged')

Plug 'kyazdani42/nvim-web-devicons'

" tab标签
Plug 'akinsho/bufferline.nvim'
nnoremap <silent><A-w>  :bd<CR>
nnoremap ,d :b#\|bd#<CR>
nnoremap <silent><A-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><A-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><A-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><A-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><A-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><A-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><A-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><A-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><A-9> <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <leader>co <Cmd>BufferLineCloseRight <CR> <Cmd>BufferLineCloseLeft<CR>
nnoremap <leader>cr <Cmd>BufferLineCloseRight<CR>
nnoremap <leader>cl <Cmd>BufferLineCloseLeft<CR>
nnoremap mr <Cmd>BufferLineMoveNext<CR>
nnoremap ml <Cmd>BufferLineMovePrev<CR>

" Plug 'ful1e5/onedark.nvim'
" Plug 'tomasiser/vim-code-dark'
Plug 'rmehri01/onenord.nvim'

  " let g:onedark_colors = {
  "       \ 'hint': '#585d69',
  "       \ 'error': '#ff0000'
  "       \ }
" Plug 'gruvbox-community/gruvbox'
" colorscheme nord
hi DiagnosticUnderlineWarn gui=undercurl
hi DiagnosticUnderlineError gui=undercurl
hi DiagnosticUnderlineInfo gui=undercurl
hi DiagnosticUnderlineHint gui=undercurl
" hi! Normal ctermbg=NONE guibg=NONE " 设置背景透明 

augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
" 高亮行
" set cursorline                          " Enable highlighting of the current line
" highlight Normal guibg=none
hi CursorLine term=none cterm=none guibg=none
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=green guibg=#135564
" hi Visual guifg=#eeeeee guibg=Grey gui=none

" 搜索结果的高亮 需要在主题后设置
" hi Search guibg=#495360 guifg=transparent
" hi! VertSplit guifg=black guibg=#002b36 ctermfg=black ctermbg=black

" 搜索文件
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'

nnoremap ma <cmd>lua require('telescope').extensions.vim_bookmarks.all()<CR>
" nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>fmw <cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_status()<CR>
nnoremap <leader>g <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>fch <cmd>lua require('telescope.builtin').command_history()<CR>
nnoremap <leader>fri <cmd>lua require('telescope.builtin').registers()<CR>
nnoremap <leader>fo  <cmd>Telescope oldfiles<CR>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'windwp/nvim-autopairs'

Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'nvim-lualine/lualine.nvim'
" 处理代码高亮和回车自动indent
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'

" 修改jsx标签
Plug 'samuelsimoes/vim-jsx-utils'
nnoremap ,e :call JSXEachAttributeInLine()<CR>

" git 
Plug 'tpope/vim-fugitive'

" 书签插件
Plug 'MattesGroeger/vim-bookmarks'
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
map mx <Nop>
map mc <Nop>
" 选中添加括号插件
Plug 'tpope/vim-surround'

Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-unimpaired'

Plug 'lewis6991/gitsigns.nvim'

Plug 'sindrets/diffview.nvim', {'on': ['DiffviewFileHistory','DiffviewOpen']}
Plug 'mhinz/vim-startify'
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_change_to_dir = 0
let g:startify_lists = [
        \ { 'header': ['   Sessions'],       'type': 'sessions' },
        \ { 'header': ['   MRU'],            'type': 'files' },
        \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
        \ ]
let g:startify_enable_special = 0
Plug 'xolox/vim-session'
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_autosave_to="default"
nnoremap <leader>ss :SaveSession<cr>
Plug 'xolox/vim-misc'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_mouse_mappings = 1

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
let g:vsnip_snippet_dir = expand('~/.config/nvim/snip')
 imap <silent><expr> <A-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<A-l>'
 imap <silent><expr> <A-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<A-h>'
Plug 'prettier/vim-prettier', {
      \ 'on': ['PrettierAsync', 'PrettierPartial'],
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
nmap <Leader>py :PrettierAsync<CR>
nmap <Leader>pp :PrettierPartial<CR>

"暂时不打开自动格式化 与eslint 冲突 use leader-p
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0

Plug 'norcalli/nvim-colorizer.lua'

" emmet
" Plug 'mattn/emmet-vim'

Plug 'ThePrimeagen/harpoon'

" tab toggle entry sign, zf打开筛选entry，C-o确认, < 回退，zN排除选中的entry
" Plug 'kevinhwang91/nvim-bqf',{'ft': ':qf', 'on': 'BqfToggle'}
Plug 'kevinhwang91/nvim-bqf'
nnoremap <leader>p <cmd>BqfToggle<CR>

Plug 'phaazon/hop.nvim'

Plug 'windwp/nvim-ts-autotag'

Plug 'RRethy/nvim-treesitter-textsubjects'

" 自动切换输入法
" Plug 'ybian/smartim'
" let g:smartim_default = 'com.apple.keylayout.ABC'

Plug 'svban/YankAssassin.vim'

Plug 'mfussenegger/nvim-dap'
au FileType dap-repl lua require('dap.ext.autocompl').attach()

call plug#end()
