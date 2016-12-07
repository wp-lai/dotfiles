"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>, default is '\'
" let mapleader=";"

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <leader>p "+p

" 依次遍历
nnoremap nw <c-w><c-w>
" 定义快捷键关闭当前分割窗口
nmap <leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <leader>Q :qa!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 根据侦测到的不同类型加载对应的插件
filetype plugin indent on

" 搜索时大小写不敏感
set ignorecase
" 但当输入大写字符时只匹配大写
set smartcase

" use vim default instead of vi default
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" UTF-8 support
set encoding=utf-8

" enable mouse support
set mouse=a

" copy paste to clipboard
" not applied in tmux
if $TMUX == ''
    set clipboard+=unnamed
endif

" set backspace
set backspace=indent,eol,start

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" show matching brakets/parenthesis
set showmatch

" edit crontab in Mac
autocmd FileType crontab setlocal nowritebackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')
    " python
    Plug 'nvie/vim-flake8', { 'for': 'python' }

    " cpp
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
    Plug 'derekwyatt/vim-fswitch', { 'for': 'cpp' }
    Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }
    Plug 'rhysd/vim-clang-format', { 'for': 'cpp' }

    " style
    " Plug 'altercation/vim-colors-solarized'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    Plug 'mhinz/vim-startify'

    " editing
    Plug 'tpope/vim-surround'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'jiangmiao/auto-pairs'
    Plug 'easymotion/vim-easymotion'

    " marks
    Plug 'kshenoy/vim-signature'

    " tags
    Plug 'Valloric/YouCompleteMe'
    Plug 'majutsushi/tagbar'

    " search and replace
    Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' }

    " comment and uncomment
    Plug 'scrooloose/nerdcommenter'

    " snippet
    Plug 'SirVer/ultisnips'

    " file navigation
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'fholgado/minibufexpl.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara'  }


    " undo tree
    Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Chinese input compatibility
    Plug 'CodeFalling/fcitx-vim-osx'

    " tmux
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'jpalardy/vim-slime'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set color
colorscheme Tomorrow-Night-Eighties
" colorscheme Tomorrow-Night
" colorscheme solarized
" colorscheme molokai

if has('gui_running')
    set background=light
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
else
    set background=dark
endif

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_solarized_bg = "dark"
" let g:airline_theme = "solarized"
let g:airline_theme = "tomorrow"


" set 256 color
set term=screen-256color

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
" Highlight while searching with / or ?
set incsearch

" Show current mode in command-line
set showmode
" Show already typed keys when more are expected
set showcmd

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
" Tab key indents by 4 spaces
set softtabstop=4

" 缩进可视化插件 Indent Guides
" 是否随vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <leader>i <Plug>IndentGuidesToggle

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
nmap <silent> <leader>sw :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => clang format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=0
" 设置显示／隐藏标签列表子窗口的快捷键。
nmap <C-t> :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1

" 正向遍历同名标签
nmap <leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <leader>tp :tprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 补全内容不以分割子窗口形式出现，只显示补全列表
" set completeopt-=preview

" do not insert until we choose one
set completeopt+=noselect

" 设置 preview window
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" 设置 python 路径
let g:ycm_python_binary_path = 'python'
" 设置运行 ycm_server 的 python 路径
let g:ycm_server_python_interpreter = '/Users/alan/anaconda3/bin/python'

" 设置 default .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
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
nnoremap <leader>sp :CtrlSF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-protodef
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 成员函数的实现顺序与声明顺序一致
" let g:disable_protodef_sorting=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => file navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nnoremap <C-N> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\.swp']

" 显示/隐藏 MiniBufExplorer 窗口
nnoremap <leader>bb :MBEToggle<CR>
" buffer 切换快捷键
nnoremap <leader>bn :MBEbn<CR>
nnoremap <leader>bp :MBEbp<CR>
nnoremap <leader>bb :MBEFocus<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => undo tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 调用 gundo 树
nnoremap <leader>uu :GundoToggle<CR>
let g:undotree_SetFocusWhenToggle=1
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>

" don't want vim-gitgutter to set up any mappings
let g:gitgutter_map_keys = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
" set backup
" set backupdir   =$HOME/.vim/files/backup/
" set backupext   =-vimbackup
" set backupskip  =
" set directory   =$HOME/.vim/files/swap/
" set updatecount =100
" set undofile
" set undodir     =$HOME/.vim/files/undo/
" set viminfo     ='100,n$HOME/.vim/files/info/viminfo
