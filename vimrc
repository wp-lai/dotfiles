"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Essential
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vi noncompatible mode
set nocompatible

" open filetype detection
filetype plugin indent on

" backspace anything
set backspace=indent,eol,start

" UTF-8 support
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map space to leader
map <Space> <leader>

" copy to system clipboard
vnoremap <leader>y "+y
" paste from system clipboard
nmap <leader>p "+p

" easy save and quit
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>e :wq<CR>

" enable undo C-u
inoremap <C-U> <C-G>u<C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set color
colorscheme Tomorrow-Night-Eighties
set background=dark

" Show my current position in the status bar
set ruler

" Show the keystrokes being entered in the screen
set showcmd

" Show the mode we're using if not normal mode (e.g. --INSERT--)
set showmode

" set 256 color
set term=screen-256color
set t_Co=256

" display status line
set laststatus=2

" display line number on current line and relativenumber on other lines
set number
set relativenumber

" highlight current position
" set cursorline
" set cursorcolumn

" highlight column 80
set colorcolumn=80

" Highlight while searching with / or ?
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap

syntax enable
syntax on

" tabs settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

set infercase

" Don't ignore case when search has capital letter
set smartcase

" Autocomplete commands using nice menu in place of window status
set wildmenu

" Enable mouse for scrolling and window resizing.
set mouse=a

" Delete comment character when joining commented lines
set formatoptions+=j

" increase command history
set history=200

" Allow buffer switching without saving"
set hidden

" enable matchit functionality
runtime macros/matchit.vim

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" show matching brakets/parenthesis
set showmatch

" more natural split opening
set splitbelow
set splitright

" Fix the & command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" edit crontab in Mac
autocmd FileType crontab setlocal nowritebackup

" restore cursor position when opening file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif "`'")"'")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoinstall Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
    " user textobj
    Plug 'kana/vim-textobj-user'

    " lint
    Plug 'w0rp/ale'
        let g:ale_lint_on_save = 1
        let g:ale_lint_on_text_changed = 0
        let g:ale_lint_on_enter = 0
        let g:ale_open_list = 1
        let g:ale_keep_list_window_open = 0
        let g:ale_linters = {
        \   'python': ['flake8'],
        \}

    " code completion
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
        " do not insert until we choose one
        set completeopt+=noselect
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_goto_buffer_command = 'vertical-split'
        let g:ycm_confirm_extra_conf = 0
        let g:ycm_python_binary_path = 'python'
        " let g:ycm_server_python_interpreter = ''
        let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
        nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>
        nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
        nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
        nnoremap <leader>jj :YcmCompleter GoToImprecise<CR>
        nnoremap <leader>jh :YcmCompleter GetDoc<CR>

    Plug 'majutsushi/tagbar'
        nmap <leader>tt :TagbarToggle<CR>
        let tagbar_left=0
        let tagbar_width=32
        let g:tagbar_compact=1

    Plug 'skywind3000/asyncrun.vim'
        autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)

    " python
    Plug 'nvie/vim-flake8', { 'for': 'python' }
    Plug 'bps/vim-textobj-python', { 'for': 'python' }

    " cpp
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
    Plug 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp'] }
        nmap <silent> <leader>sw :FSHere<CR>
        let b:fswitchdst  = 'cpp, h'
    Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }
    Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
        let g:clang_format#style_options = {
                    \ "AccessModifierOffset" : -4,
                    \ "AllowShortIfStatementsOnASingleLine" : "true",
                    \ "AlwaysBreakTemplateDeclarations" : "true",
                    \ "Standard" : "C++11"}
        autocmd FileType c,cpp nnoremap <buffer><leader>= :<C-u>ClangFormat<CR>
        autocmd FileType c,cpp vnoremap <buffer><leader>= :ClangFormat<CR>

    " golang
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
        autocmd FileType go nnoremap <F9> :GoRun<CR>

    " style
    " Plug 'flazz/vim-colorschemes'
    " Plug 'junegunn/seoul256.vim'
    Plug 'lifepillar/vim-solarized8'
    Plug 'nathanaelkane/vim-indent-guides'
        let g:indent_guides_enable_on_vim_startup=0
        let g:indent_guides_start_level=2
        let g:indent_guides_guide_size=1
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_powerline_fonts = 1
        let g:airline_theme = "tomorrow"
    Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
        nnoremap <silent> <leader>z :Goyo<CR>
        autocmd! User GoyoEnter Limelight
        autocmd! User GoyoLeave Limelight!
    Plug 'mhinz/vim-startify'

    " utilities
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-voom/VOoM'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-unimpaired'

    " search
    Plug 'google/vim-searchindex'
    Plug 'mileszs/ack.vim'
        nnoremap <C-f> :Ack<SPACE>
        if executable('ag')
            let g:ackprg = 'ag --vimgrep'
        endif

    " comment and uncomment
    Plug 'tpope/vim-commentary'

    " snippet
    Plug 'SirVer/ultisnips'

    " file navigation
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        nnoremap <C-N> :NERDTreeToggle<CR>
        let NERDTreeWinSize=32
        let NERDTreeWinPos="left"
        let NERDTreeShowHidden=0
        let NERDTreeMinimalUI=1
        let NERDTreeAutoDeleteBuffer=1
        let NERDTreeIgnore=['\.pyc','\.swp']
    Plug 'jlanzarotta/bufexplorer'
        let g:bufExplorerShowRelativePath=1
        nmap <leader>o :BufExplorer<CR>
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'
        nnoremap <C-p> :FZF<CR>
        nnoremap <leader>bb :Buffers<CR>
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)
        " imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        " imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <plug>(fzf-complete-line)

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
        let g:gitgutter_map_keys = 0

    " Chinese input compatibility
    Plug 'CodeFalling/fcitx-vim-osx'

    " tmux
    Plug 'christoomey/vim-tmux-navigator'
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
        nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
        nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
        nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
        nnoremap <silent> <C-/> :TmuxNavigatePrevious<CR>

    " see registor contents
    Plug 'junegunn/vim-peekaboo'

    " markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customizations about Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pep8 style
autocmd FileType python setlocal ts=4 sts=4 sw=4 et
let python_highlight_all=1

" add matching pairs
autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'

" run yapf formater
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR><C-o>

" add breakpoint
autocmd FileType python nnoremap <leader>bk :normal Oimport ipdb; ipdb.set_trace()<ESC>j

" enable using `gf` to search module
autocmd FileType python setlocal path+=/Users/alan/anaconda3/lib/python3.6,/Users/alan/anaconda3/lib/python3.6/site-packages

" use make to run python
autocmd FileType python setlocal makeprg=python\ %
autocmd FileType python compiler pyunit

" run python
autocmd FileType python nnoremap <F9> :!python %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c,cpp nnoremap <F9> :call CompileAndRun()<CR>
function! CompileAndRun()
    exec "w"
    if (&filetype == 'c')
        exec "AsyncRun clang % -o %< && ./%<"
    elseif (&filetype == 'cpp')
        exec "AsyncRun clang++ -std=c++1y % -o %< && ./%<"
    " elseif (&filetype == 'python')
    "     exec "AsyncRun python %"
    " elseif (&filetype == 'go')
    "     exec "GoRun"
    endif
endfunction

