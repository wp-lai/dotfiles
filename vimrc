"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键的前缀，即 <leader>
let mapleader=";"

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <leader>p "+p

" 依次遍历
nnoremap nw <c-w><c-w>
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启文件类型侦测
filetype on
" " 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" UTF-8 support
set encoding=utf-8

" set 256 color
set term=screen-256color

" enable mouse support
set mouse=a

" copy paste to clipboard
set clipboard=unnamed

" edit crontab in Mac
autocmd FileType crontab setlocal nowritebackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" python
Plugin 'nvie/vim-flake8'

" cpp
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rhysd/vim-clang-format'

" style
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" editing
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'

" marks
Plugin 'kshenoy/vim-signature'

" tags
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

" search and replace
Plugin 'dyng/ctrlsf.vim'

" comment and uncomment
Plugin 'scrooloose/nerdcommenter'

" snippet
Plugin 'SirVer/ultisnips'

" file navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fholgado/minibufexpl.vim'

" undo tree
Plugin 'sjl/gundo.vim'

" git
Plugin 'tpope/vim-fugitive'

" Chinese input compatibility
Plugin 'CodeFalling/fcitx-vim-osx'

" tmux
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set dark background color
colorscheme solarized

if has('gui_running')
    set background=light
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
else
    set background=dark
endif

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg = "dark"
let g:airline_theme = "solarized"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Displays
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number
set relativenumber

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 显示 80  列位置
set colorcolumn=80

" 高亮显示搜索结果
" set hlsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 禁止折行
set nowrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 缩进可视化插件 Indent Guides
" 是否随vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax

" 启动 vim 时关闭折叠代码
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customizations about Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autorun python
nnoremap <F9> :exec '!python' shellescape(@%, 1)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customizations about c++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fswitch *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。
nmap <leader>tb :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 补全内容不以分割子窗口形式出现，只显示补全列表
" set completeopt-=preview

" 设置 preview window
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" 设置 python 路径
let g:ycm_python_binary_path = 'python'
" 设置运行 ycm_server 的 python 路径
let g:ycm_server_python_interpreter = '/Users/alan/anaconda3/bin/python'

" 设置 default .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlSF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。
" 快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-protodef
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => file navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
map <C-N> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\.swp']

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<CR>
" buffer 切换快捷键
map <Leader>bn :MBEbn<CR>
map <Leader>bp :MBEbp<CR>
map <Leader>bb :MBEFocus<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => undo tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => clang format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>
