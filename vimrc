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

" quickly move current line up or down
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" navigate tabs
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

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
" 禁止折行
set nowrap

syntax enable
syntax on

" Replace tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" Don't ignore case when search has capital letter
set smartcase

" Autocomplete commands using nice menu in place of window status
set wildmenu

" Enable mouse for scrolling and window resizing.
set mouse=a

" Delete comment character when joining commented lines
set formatoptions+=j

" enable matchit functionality
if !exists('g:loaded_matchit')
  runtime macros/matchit.vim
endif

" copy paste to clipboard
" " not applied in tmux
" if $TMUX == ''
"     set clipboard+=unnamed
" endif

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" show matching brakets/parenthesis
set showmatch

" more natural split opening
" set splitbelow
set splitright

" edit crontab in Mac
autocmd FileType crontab setlocal nowritebackup

" restore cursor position when opening file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif "`'")"'")

" source vimrc on saving
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

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
        let tagbar_left=0
        nmap <leader>tt :TagbarToggle<CR>
        let tagbar_width=32
        let g:tagbar_compact=1

    " python
    Plug 'nvie/vim-flake8', { 'for': 'python' }
    Plug 'bps/vim-textobj-python', { 'for': 'python' }

    " cpp
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
    Plug 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp'] }
        nmap <silent> <leader>sw :FSHere<cr>
        let b:fswitchdst  = 'cpp, h'
    Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }
    Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
        let g:clang_format#style_options = {
                    \ "AccessModifierOffset" : -4,
                    \ "AllowShortIfStatementsOnASingleLine" : "true",
                    \ "AlwaysBreakTemplateDeclarations" : "true",
                    \ "Standard" : "C++11"}
        autocmd FileType c,cpp nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
        autocmd FileType c,cpp vnoremap <buffer><leader>cf :ClangFormat<CR>

    " style
    Plug 'flazz/vim-colorschemes'
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
        nnoremap <silent> <leader>z :Goyo<cr>
        autocmd! User GoyoEnter Limelight
        autocmd! User GoyoLeave Limelight!
    Plug 'mhinz/vim-startify'

    " utilities
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-voom/VOoM'
    Plug 'tpope/vim-repeat'

    " search and replace
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
    Plug 'ctrlpvim/ctrlp.vim'
        let g:ctrlp_use_caching = 0
        if executable('ag')
            set grepprg=ag\ --nogroup\ --nocolor
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        endif
    Plug 'jlanzarotta/bufexplorer'
        let g:bufExplorerShowRelativePath=1
        nmap <leader>o :BufExplorer<cr>
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
        let g:gitgutter_map_keys = 0

    " Chinese input compatibility
    Plug 'CodeFalling/fcitx-vim-osx'

    " tmux
    Plug 'christoomey/vim-tmux-navigator'
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
        nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

    " see registor contents
    Plug 'junegunn/vim-peekaboo'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customizations about Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add matching pairs
autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'

" run yapf formater
autocmd FileType python nnoremap <leader>ya :0,$!yapf<Cr><C-o>

" add breakpoint
autocmd FileType python nnoremap <leader>bk :normal Oimport ipdb; ipdb.set_trace()<ESC>j

" Turn on Python syntax highlighting for all syntax types
let python_highlight_all=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F9> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        exec "!clang % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!clang++ -std=c++1y % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'python'
        exec "!time python %"
    endif
endfunc

