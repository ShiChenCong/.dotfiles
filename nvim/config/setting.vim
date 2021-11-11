
set nocompatible  " 关闭 vi 兼容模式, 必选
syntax enable                           " Enables syntax highlighing
set guifont=Hack\ Nerd\ Font:h14
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=2
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set foldmethod=indent                 " 开启手动折叠代码w"
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set autoindent " 自动缩进, 需要与 smartindent 配合使用才有效果
set smartindent " 智能缩进, 在进行代码编写的时候会智能判断缩进距离, 与 autoindent 配合使用
set number                              " Line numbers
" set relativenumber
set wildmenu " 输入部分命令按下 tab 键可以弹出符合的命令列表
set wildmode=full
set showcmd " 右下角显示正在操作的命令
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
" set autochdir                           " Your working directory will always be the same as your working directory
set fillchars=vert:\|
set termguicolors
set showmatch
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
set fdm=indent
set foldlevelstart=99
set undolevels=99999
" 新一行 不带上行的注释
au BufEnter * set fo-=c fo-=r fo-=o
" autocmd BufWritePre <cmd>EslintFixAll<CR>

" 提前打开signcolumn 
set signcolumn=yes
cmap w!! w !sudo tee %
