
nnoremap <silent><A-w>  :bd<CR>
" nnoremap ,d :b#\|bd#<CR>

nnoremap ,e :call JSXEachAttributeInLine()<CR>
nnoremap <leader>fmw <cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_status()<CR>
nnoremap <leader>g <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>fch <cmd>lua require('telescope.builtin').command_history()<CR>
nnoremap <leader>fri <cmd>lua require('telescope.builtin').registers()<CR>
nnoremap <leader>fo  <cmd>lua require('telescope.builtin').oldfiles({only_cwd=true})<CR>
nnoremap <leader>e <cmd>EslintFixAll<CR>
inoremap <A-a> <Esc> :wq<CR>
nnoremap <A-a> <Esc> :wq<CR>
nnoremap <A-q> :q<CR>

nnoremap <leader><M-j>    :resize +2<CR>
nnoremap <leader><M-k>    :resize -2<CR>
nnoremap <leader><M-h>    :vertical resize +2<CR>
nnoremap <leader><M-l>    :vertical resize -2<CR>

" <TAB>: completion. tab选中提示
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better tabbing
vnoremap < <gv
vnoremap > >gv

nnoremap <TAB> <Cmd>BufferLineCycleNext<CR>
nnoremap <leader><TAB> <Cmd>BufferLineCyclePrev<CR>

map sh <C-w>h
map sj <C-w>j
map sk <C-w>k
map sl <C-w>l

nnoremap ,f :let @+ = fnamemodify(expand("%"), ":~:.")<CR>

" 前进光标记录
nnoremap <A-o> <C-i>
" 后退光标记录 
nnoremap <A-i> <C-o>
 
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
inoremap <M-j> <esc>:m .+1<CR>==
inoremap <M-k> <esc>:m .-2<CR>==
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

" 去开头
nnoremap H ^
vnoremap H ^
" 去行尾 
nnoremap L $
vnoremap L $

nmap ss :split<Return>
nmap sv :vsplit<Return>

nnoremap p p`]

" 先点击* normal模式下进行替换
" nnoremap <Leader>r :%s///g<Left><Left>
" nnoremap <Leader>rc :%s///gc<Left><Left><Left>
nnoremap <Leader>r  :%s/<C-r><C-w>//g<Left><Left><Left>
nnoremap <Leader>rc  :%s/<C-r><C-w>//gc<Left><Left><Left>
" 先点击* 自动搜索光标所在的单词替换后 点击n切换到下一个单词 进行替换操作
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

"先点击* 选中需要替换的代码快后在 visual模式下进行替换
xnoremap <Leader>r :s/<C-r><C-w>//g<Left><Left>
xnoremap <Leader>rc :s/<C-r><C-w>//gc<Left><Left><Left>

nnoremap { {zz
nnoremap } }zz

nnoremap ; :
vnoremap ; :

" ciw不复制原有单词
nnoremap c "0c

nnoremap <leader>' :execute "normal \<Plug>Ysurroundiw\""<cr>
nnoremap <leader>[ :execute "normal \<Plug>Ysurroundiw]"<cr>
nnoremap <leader>{ :execute "normal \<Plug>Ysurroundiw{"<cr>
nnoremap <leader>( :execute "normal \<Plug>Ysurroundiw("<cr>

" git相关的map
" 获取整个文件夹的git历史
" nnoremap <leader>gdh :DiffviewFileHistory ./<CR>
" 当前文件的git历史
" nnoremap <leader>gfh :DiffviewFileHistory<CR>
" 打开当前的变动
" nnoremap <leader>gd :DiffviewOpen<CR>
" 关闭diff
" nnoremap <leader>gc :DiffviewClose<CR>
" 当前文件的历史git commit
" nnoremap <leader>cc :0Gclog<CR>
" nnoremap ,g :Git<CR>
" nnoremap <leader>gp :Git push<CR>
" nnoremap <leader>gm :Git log --pretty=format:"%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --graph<CR>
" 使用右边的(其他分支)
nmap <leader>gr :diffget //3<CR>
" 使用左边的(本地)
nmap <leader>gl :diffget //2<CR>


nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

nnoremap <expor> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expor> j (v:count > 5 ? "m'" . v:count : "") . 'j'


nnoremap <Leader><CR> :so ~/.config/nvim/init.lua<CR>

" jsx 每个属性一行
nnoremap <leader>el :s/ /\r/g<CR> :EslintFixAll <CR> :noh <CR>

" quickfixlist
nnoremap cl :copen<CR>
nnoremap co :cclose<CR>
" location list
" nnoremap <leader>q :call ToggleQuickFix()<CR>

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

inoremap <C-u> <C-g>u<C-u>
inoremap <C-o> <Esc>ddO
imap <C-d> <esc>yypi

nnoremap mt %

nnoremap qf :bd<CR>
nnoremap gq :q<CR>


" nnoremap <leader>tn :tabnew<CR>
" nnoremap <leader>tl :tabnext<CR>
" nnoremap <leader>th :tabprevious<CR>
" nnoremap <leader>tc :tabclose<CR>
" nnoremap <leader>to :tabonly<CR>

" next folded code
nnoremap <silent> zj :call NextClosedFold('j')<cr> zz
nnoremap <silent> zk :call NextClosedFold('k')<cr> zz

function! NextClosedFold(dir)
  let cmd = 'norm!z' . a:dir
  let view = winsaveview()
  let [l0, l, open] = [0, view.lnum, 1]
  while l != l0 && open
      exe cmd
      let [l0, l] = [l, line('.')]
      let open = foldclosed(l) < 0
  endwhile
  if open
      call winrestview(view)
  endif
endfunction

nnoremap ,r :LspRestart<CR>

nnoremap ,v V$%

tnoremap <Esc> <C-\><C-n>

" 替换const x = require('y')为import
let @i = 'ceimportf=cf(from f)x'
nnoremap <leader>cri :global/require/normal @i<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
echo "@".getcmdline()
execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap * *``
nnoremap <leader>m *``

let g:vsnip_snippet_dir = expand('~/.config/nvim/snip')
imap <silent><expr> <A-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<A-l>'
imap <silent><expr> <A-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<A-h>'

nmap <Leader>py :PrettierAsync<CR>
nmap <Leader>pp :PrettierPartial<CR>
nnoremap <leader>p <cmd>BqfToggle<CR>

au FileType dap-repl lua require('dap.ext.autocompl').attach()

