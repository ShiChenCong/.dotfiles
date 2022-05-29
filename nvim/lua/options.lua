local options = {
  -- 侧边滚动
  sidescrolloff = 2,
  -- 上下滚动
  scrolloff = 2,
  -- 换行
  wrap = false,
  -- 命令行高度
  cmdheight = 1,
  -- 侧边数字栏
  number = true,
  -- 复用系统剪切板
  clipboard = "unnamedplus",
  -- 只显示一个status line
  laststatus = 3,
  -- 换行自动indent
  smartindent = true,
  -- expandtab的作用是把tab字符转化空格
  expandtab = true,
  -- tabstop的作用是一个tab显示多少个空格,修改显示的宽度。
  tabstop = 2,
  -- softtabstop = 2,
  -- smarttab = true,
  -- 自动缩进时,缩进长度为2
  shiftwidth = 2,
  -- 右下角不显示正在操作的命令
  showcmd = false,
  -- 同一行换行显示的时候带上indent
  breakindent = true,
  -- 重新打开文件也可以用undo
  undofile = true,
  -- 补全菜单的高度
  pumheight = 10,
  -- 自动分屏后的位置
  splitbelow = true,
  splitright = true,
  -- 关闭swapfile
  swapfile = false,
  -- 默认忽略大小写，当搜索的内容包含大写字母则改为大小写敏感
  ignorecase = true,
  smartcase = true,
  -- 提前开启signcolumn 避免输入时侧边栏移动
  signcolumn = "yes",
  -- 折叠代码 默认有些代码无法识别折叠 比如jsx等
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  -- 默认打开文件不折叠
  foldenable = false,
  foldlevel = 99,
  -- enable mouseclicks
  mouse = 'a',
  completeopt = { "menu", "menuone", "noselect" }
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[syntax enable]]
vim.cmd [[ set fillchars+=diff:╱]]
-- 关闭vim-mutli-cursor plugin的warning
vim.g['VM_show_warnings'] = 0
