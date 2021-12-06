
source $HOME/.config/nvim/config/mappings.vim

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if exists('g:vscode')
  " vscode plugin
  source $HOME/.config/nvim/vscode/mapping.vim
else
  source $HOME/.config/nvim/config/setting.vim
  if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
  endif
  filetype plugin indent on
  call plug#begin('~/.config/nvim/plugged')
  " 目录树
  " Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'

  set termguicolors " this variable must be enabled for colors to be applied properly

  " tab标签
  Plug 'akinsho/bufferline.nvim'
  " nnoremap <silent><A-w>  :lua require('bufferBar').closeBuffer()<CR>
  nnoremap <silent><A-w>  : bd<CR>
  nnoremap <silent><A-1> <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><A-2> <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><A-3> <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><A-4> <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><A-5> <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><A-6> <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><A-7> <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><A-8> <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><A-9> <Cmd>BufferLineGoToBuffer 9<CR>
  nnoremap <leader>co :BufferLineCloseRight <CR>:BufferLineCloseLeft<CR>
  nnoremap <leader>cr :BufferLineCloseRight<CR>
  nnoremap <leader>cl :BufferLineCloseLeft<CR>
  nnoremap mr :BufferLineMoveNext<CR>
  nnoremap ml :BufferLineMovePrev<CR>

  " Plug 'ful1e5/onedark.nvim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'onsails/lspkind-nvim'

    " let g:onedark_colors = {
    "       \ 'hint': 'orange',
    "       \ 'error': '#ff0000'
    "       \ }
  syntax enable
  " Plug 'gruvbox-community/gruvbox'
  colorscheme codedark
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  " front
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4 

  " 高亮行
  set cursorline                          " Enable highlighting of the current line
  " hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=green guibg=#135564
  " hi Visual guifg=#eeeeee guibg=Grey gui=none


  " 搜索结果的高亮 需要在主题后设置
  " hi Search guibg=#495360 guifg=transparent

  " hi! VertSplit guifg=black guibg=#002b36 ctermfg=black ctermbg=black

  " 搜索文件
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'tom-anders/telescope-vim-bookmarks.nvim'

  nnoremap ma :lua require('telescope').extensions.vim_bookmarks.all()<CR>
  " nnoremap <leader>fw :lua require'telescope.builtin'.live_grep()<CR>
  nnoremap <leader>fw :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
  " nnoremap <leader>fmw :lua require'telescope.builtin'.grep_string()<CR>
  nnoremap <leader>fmw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
  nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
  nnoremap <leader>fg :lua require('telescope.builtin').git_status()<CR>
  " nnoremap <leader>fb :lua require('telescope.builtin').file_browser({ cwd = vim.fn.expand("%:p:h") })<CR>
  nnoremap <leader>fb :lua require('telescope.builtin').git_branches()<CR>
  nnoremap <leader>fch :lua require('telescope.builtin').command_history()<CR>
  nnoremap <leader>fri :lua require('telescope.builtin').registers()<CR>
  nnoremap <leader>fo  :Telescope oldfiles<CR>
  " nnoremap <leader>fp :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
  " jsx 回车 indent插件
  " Plug 'chemzqm/vim-jsx-improve'
   " Plug 'pangloss/vim-javascript'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " 完整匹配单词 且可以指定目录搜索
  command! -bang -nargs=+ -complete=dir Ra call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  let g:fzf_action = {
        \ 'ctrl-q': function('s:build_quickfix_list'),
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' }
  " Plug 'mileszs/ack.vim'

  " Plug 'jiangmiao/auto-pairs'
  " let g:AutoPairsShortcutToggle = ''
  " let g:AutoPairsShortcutFastWrap = ''
  " let g:AutoPairsShortcutBackInsert = ''
  " let g:AutoPairsShortcutJump = ''
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'windwp/nvim-autopairs'

  " Plug 'b3nj5m1n/kommentary'
  Plug 'numToStr/Comment.nvim'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'

  Plug 'nvim-lualine/lualine.nvim'
  " 处理代码高亮和回车自动indent
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'maxmellon/vim-jsx-pretty'

  " 修改jsx标签
  Plug 'samuelsimoes/vim-jsx-utils'
  nnoremap <leader>ct :call JSXChangeTagPrompt()<CR>
  nnoremap <leader>ce :call JSXEachAttributeInLine()<CR>
  " nnoremap vat :call JSXSelectTag()<CR>

  " git 
  Plug 'tpope/vim-fugitive'

  " 书签插件
  Plug 'MattesGroeger/vim-bookmarks'
  highlight BookmarkSign ctermbg=NONE ctermfg=160
  highlight BookmarkLine ctermbg=194 ctermfg=NONE
  let g:bookmark_sign = '♥'
  let g:bookmark_highlight_lines = 1
  map mx <Nop>
  " 选中添加括号插件
  Plug 'tpope/vim-surround'

  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

  " Plug 'rlue/vim-barbaric'
  Plug 'tpope/vim-unimpaired'
  " Plug 'airblade/vim-gitgutter'
  " nmap ]h <Plug>(GitGutterNextHunk)
  " nmap [h <Plug>(GitGutterPrevHunk)

  Plug 'lewis6991/gitsigns.nvim'

  Plug 'sindrets/diffview.nvim'
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
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
  " Plug 'rinx/lspsaga.nvim'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  let g:vsnip_snippet_dir = expand('~/.config/nvim/snip')
  imap <silent><expr> <A-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<A-l>'
  imap <silent><expr> <A-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<A-h>'
  " imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  " smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  " imap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
  " smap <expr><Tab> vsnip#jumpable(1)     ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  " imap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  " smap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
  nmap <Leader>py :PrettierAsync<CR>

  "暂时不打开自动格式化 与eslint 冲突 use leader-p
  " let g:prettier#autoformat = 1
  " let g:prettier#autoformat_require_pragma = 0

  Plug 'norcalli/nvim-colorizer.lua'

  " emmet
  Plug 'mattn/emmet-vim'


  Plug 'ThePrimeagen/harpoon'


  " Plug 'karb94/neoscroll.nvim'

  Plug 'kevinhwang91/nvim-bqf',{'ft': ':qf'}
  nnoremap <leader>p :BqfToggle<CR>

  Plug 'phaazon/hop.nvim'
  nnoremap ff :HopChar1<CR>

  Plug 'windwp/nvim-ts-autotag'

  Plug 'RRethy/nvim-treesitter-textsubjects'

  call plug#end()

endif
