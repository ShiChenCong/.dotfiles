let g:mapleader = "\<Space>"

nnoremap <silent><Backspace> :noh<CR>

" Alternate way to save
" inoremap <A-s> <C-o>:w<CR>
inoremap <A-s> <Esc> :w<CR>
nnoremap <A-s> <Esc> :w<CR>

nnoremap <leader>w :w<CR>

nnoremap <leader>e <cmd>EslintFixAll<CR>
inoremap <A-a> <Esc> :wq<CR>
nnoremap <A-a> <Esc> :wq<CR>
" Alternate way to quit
" nnoremap <A-q> <C-w>j :q<CR> :Gedit <CR>
nnoremap <A-q> :q<CR>
nnoremap ,q :bd<CR>
imap jj <Esc> 

" nnoremap <F9> :set hlsearch!<CR>

nnoremap <leader><M-j>    :resize +2<CR>
nnoremap <leader><M-k>    :resize -2<CR>
nnoremap <leader><M-h>    :vertical resize +2<CR>
nnoremap <leader><M-l>    :vertical resize -2<CR>

" <TAB>: completion. tab选中提示
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" nnoremap <A-n> :cn<CR>
" nnoremap <A-p> :cp<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" function! CenteredFindNext(forward)
"     " save the current value for later restore
"     let s:so_curr=&scrolloff
"     set scrolloff=999
"     try
"         if a:forward
"         else
"             silent normal! N
"         endif
"     finally
"         " restore no matter what
"         let &scrolloff=s:so_curr
"     endtry
" endfunction

" nnoremap <silent>n :call CenteredFindNext(1)<CR>
" nnoremap <silent>N :call CenteredFindNext(0)<CR>

" Better nav for omnicomplete
" inoremap <expr> <C-j> ("\<C-n>")
" inoremap <expr> <C-k> ("\<C-p>")
" TAB in general mode will move to text buffer
nnoremap <TAB> <Cmd>BufferLineCycleNext<CR>
" SHIFT-TAB will go back
nnoremap <leader><TAB> <Cmd>BufferLineCyclePrev<CR>
" 切换window
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

map sh <C-w>h
map sj <C-w>j
map sk <C-w>k
map sl <C-w>l


nnoremap ,f :let @+ = fnamemodify(expand("%"), ":~:.")<CR>
" 搜索文件
" nnoremap <A-f> :FZF<CR>
" 搜索单词 如果要全匹配单词 使用 Ra
" nnoremap <A-d> :Rg <CR>
nnoremap <A-h> :History <CR>

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

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录
cnoremap <expr> %% getcmdtype( ) == 'Dir: ' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录

" inoremap <C-l>    <Right>
" cnoremap <C-l>    <Right>
" inoremap <C-i>    <Left>
" cnoremap <C-i>    <Left>

" inoremap <C-j>    <Down>
" inoremap <C-k>    <Up>

nmap ss :split<Return>
nmap sv :vsplit<Return>

" noremap p gp
" noremap P gP
" noremap gp p
" noremap gP P
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

" nnoremap <C-k> :cnext<CR>zz
" nnoremap <C-j> :cprev<CR>zz

nnoremap ; :
vnoremap ; :

" register 第一个是"" 第一个是"0
" nnoremap p "0p
" nmap ,P "0
nnoremap c "0c

nnoremap <leader>' :execute "normal \<Plug>Ysurroundiw\""<cr>
nnoremap <leader>[ :execute "normal \<Plug>Ysurroundiw]"<cr>
nnoremap <leader>{ :execute "normal \<Plug>Ysurroundiw{"<cr>
nnoremap <leader>( :execute "normal \<Plug>Ysurroundiw("<cr>

" git相关的map
" 获取整个文件夹的git历史
nnoremap <leader>gdh :DiffviewFileHistory ./<CR>
" 当前文件的git历史
nnoremap <leader>gfh :DiffviewFileHistory<CR>
" 打开当前的变动
nnoremap <leader>gd :DiffviewOpen<CR>
" 关闭diff
nnoremap <leader>gc :DiffviewClose<CR>
" 当前文件的历史git commit
nnoremap <leader>cc :0Gclog<CR>
nnoremap ,g :Git<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gm :Git log --pretty=format:"%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --graph<CR>
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


inoremap <buffer> <C-s> <esc>yiwi<lt><esc>ea></><esc>hpF>a
" inoremap <buffer> <C-s> <esc>yiwi<lt><esc>ea></><esc>hpF>i

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <A-f> /
inoremap <A-f> <Esc>/

nnoremap <leader>m *

nnoremap <leader>el :s/ /\r/g<CR> :EslintFixAll <CR> :noh <CR>


" quickfixlist
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap cl :copen<CR>
nnoremap co :cclose<CR>
" location list
nnoremap <leader>q :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun


inoremap <C-u> <C-g>u<C-u>
inoremap <C-o> <Esc>ddO
imap <C-d> <esc>yypi

nnoremap mt %

nnoremap qf :bd<CR>
nnoremap gq :q<CR>


nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

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


let @i = 'ceimportf=cf(from f)x'
nnoremap <leader>cri :global/require/normal @i<CR>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
