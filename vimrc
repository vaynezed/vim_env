set clipboard=exclude:.*
set nocompatible
" 设置历史记录步数
set history=10000
" 开启相关插件
filetype on
filetype plugin on
filetype indent on
" 当文件在外部被修改时，自动更新该文件
set autoread
"""""""""""""""""""""""""""""""""
" => 字体和颜色
"""""""""""""""""""""""""""""""""
" 开启语法
syntax enable
colorscheme desert
" 设置字体
set guifont=dejaVu\ Sans\ MONO\ 10
" 设置配色
"""""""""""""""""""""""""""""""""
" => 代码折叠功能
"""""""""""""""""""""""""""""""""
" 激活折叠功能
set foldenable
set foldmethod=manual
" 设置折叠区域的宽度
set foldcolumn=0
" 设置折叠层数为3
setlocal foldlevel=3
" 设置为自动关闭折叠
set foldclose=all
" 用空格键来代替zo和zc快捷键实现开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"""""""""""""""""""""""""""""""""
" => 文字处理
"""""""""""""""""""""""""""""""""
" 使用空格来替换Tab
set expandtab
" 设置所有的Tab和缩进为4个空格
set tabstop=4
" 设定 << 和 >> 命令移动时的宽度为4
set shiftwidth=4
" 使得按退格键时可以一次删掉4个空格
set softtabstop=4
set smarttab
" 缩进，自动缩进（继承前一行的缩进）
set ai
" 智能缩进
set si
" 自动换行
set wrap
" 设置软宽度
set sw=4
"""""""""""""""""""""""""""""""""
" => Vim 界面
"""""""""""""""""""""""""""""""""
" Turn on Wild menu
set wildmenu
" 显示标尺
set ruler
" 设置命令行的高度
set cmdheight=1
" 显示行数
set nu
set lz
" 设置退格
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" 设置魔术
set magic
" 关闭错误信息响铃
set noerrorbells
" 关闭使用可视响铃代替呼叫
set novisualbell
" 显示匹配的括号
set showmatch
set mat=2
" 搜索时高亮显示搜索到的内容
set hlsearch
" 搜索时不区分大小写
set ignorecase
set smartcase
"""""""""""""""""""""""""""""""""
" => 编码设置
"""""""""""""""""""""""""""""""""
" 设置编码
set encoding=utf-8
" 设置文件编码
set fileencodings=utf-8
" 设置终端编码
set termencoding=utf-8
"""""""""""""""""""""""""""""""""
" => 其他设置
"""""""""""""""""""""""""""""""""
" 开启新行时使用智能自动缩进
set visualbell
set smartindent
set cin
set showmatch
" 隐藏工具栏
set guioptions-=T
" 隐藏菜单栏
set guioptions-=m
" 置空错误铃声的终端代码
set vb t_vb=
" 显示状态栏
set laststatus=2
" 粘贴不换行问题的解决方法
set pastetoggle=<F9>
" 设置背景色
set background=dark
" 设置高亮相关
highlight Search ctermbg=black ctermfg=white guifg=white guibg=black

set re=1
set ttyfast
set lazyredraw
set tags=./.tags;,.tags


set mouse=
" 映射窗口移动快捷键
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l




let g:ale_linters = {
  \'python': ['pylint'],
  \'cpp': ['cpplint','clang'],
\}
let g:ale_cpp_clang_options = '-std=c++1z -Wall'
let g:ale_fixers = {
  \'*': ['prettier'],
  \'python': ['yapf','isort'],
  \'cpp': ['clang-format'],
  \'sh': ['shfmt'],
\}
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TagbarToggle<CR>
noremap <F4> :vertical terminal<CR>
noremap <F10> :ALEFix<CR>


let g:c_clangformat_use_local_file = '/home/codekali/.clang-format'

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F12> :call asyncrun#quickfix_toggle(6)<cr>


nnoremap <silent> <F8> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>



" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px','--c++-kinds=+l']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px','--c-kinds=+l']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


let g:completor_filetype_map = {}
" Enable lsp for go by using gopls
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls'}
" Enable lsp for rust by using rls
let g:completor_filetype_map.rust = {'ft': 'lsp', 'cmd': 'rls'}
" Enable lsp for c by using clangd
let g:completor_filetype_map.c = {'ft': 'lsp', 'cmd': 'clangd-7'}


let g:Lf_ShortcutF = '<c-p>'
