"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config only for vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim

  set encoding=utf8

  if has('syntax') && has('eval')
    packadd! matchit
  endif

  set undodir=~/.vim/undo
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config for neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  set laststatus=1
  set mouse=a
  set scrolloff=5
  inoremap <C-U> <C-G>u<C-U>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Essential
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase   " Ignore case when searching
set smartcase    " Don't ignore case when search has capital letter
set nojoinspaces " prevents insert two space after punctuation
set hidden       " Allow buffer switching without saving
set showmatch    " show matching brakets/parenthesis
set relativenumber
set splitbelow
set splitright

" making undo persist between sessions
set undofile
augroup undo
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" When editing a file, always jump to the last known cursor position.
augroup vimStartup
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Space> <leader>
xmap <Space> <leader>

" copy to system clipboard
vnoremap <leader>y "+y
" paste from system clipboard
nmap <leader>p "+p

" easy save and quit
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>e :wq<CR>

" quick close quickfix & location & preview window
nnoremap <leader>a :cclose<CR>:lclose<CR>:pclose<CR>

" use w!! to save files with sudo
cmap w!! w !sudo tee > /dev/null %

" Fix the & command (repeat last substitute)
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . "/.vim/pack/minpac/start/gruvbox")
    set background=dark
    colorscheme gruvbox
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" self-install minpac
if empty(glob('~/.vim/pack/minpac/opt/minpac'))
  let s:minpac_first_install=1
  silent !git clone https://github.com/k-takata/minpac.git
                          \ ~/.vim/pack/minpac/opt/minpac
endif

function! PackInit() abort
  packadd minpac
  call minpac#init({'verbose': 3})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " utilities
  call minpac#add('bronson/vim-trailing-whitespace') " highlight trailing whitespace
  call minpac#add('tpope/vim-unimpaired')            " Pairs of handy bracket mappings
  call minpac#add('tpope/vim-commentary')            " gc to comment/uncomment
  call minpac#add('tpope/vim-surround')              " ds/cs to delete/change surroundings
  call minpac#add('google/vim-searchindex')          " display search index
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('Valloric/ListToggle')             " easy toggle quickfix/location list

  " style
  call minpac#add('junegunn/goyo.vim')               " distract-free mode
  call minpac#add('morhetz/gruvbox')
  call minpac#add('mhinz/vim-startify')              " fancy start screen
  call minpac#add('machakann/vim-highlightedyank')   " highlight yank text

  " git
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('airblade/vim-gitgutter')

  " pandoc
  call minpac#add('vim-pandoc/vim-pandoc-syntax')
  call minpac#add('vim-pandoc/vim-pandoc')

  " fzf
  call minpac#add('junegunn/fzf', {'do': '!./install --all'})
  call minpac#add('junegunn/fzf.vim')

  " grep
  call minpac#add('mhinz/vim-grepper')

  " lsp
  call minpac#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': '!./install.sh'})

  " code completion
  call minpac#add('Shougo/deoplete.nvim')

  " testing
  " call minpac#add('janko/vim-test')

  " Chinese input
  " call minpac#add('rlue/vim-barbaric')
endfunction

" user commands for updating/cleaning the plugins
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" addintional functionality
function! PackList(...)
  call PackInit()
  return join(sort(keys(minpac#getpluglist())), "\n")
endfunction
" execute :PackOpenDir <plugin> to open a shell at the directory of the plugin
command! -nargs=1 -complete=custom,PackList
      \ PackOpenDir call PackInit() | call term_start(&shell,
      \    {'cwd': minpac#getpluginfo(<q-args>).dir,
      \     'term_finish': 'close'})
" execute :PackOpenUrl <plugin> to open the repo of the plugin in a browser
command! -nargs=1 -complete=custom,PackList
      \ PackOpenUrl call PackInit() | call openbrowser#open(
      \    minpac#getpluginfo(<q-args>).url)

" self-install packages
if exists('s:minpac_first_install')
  call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
nnoremap <silent> <leader>z :Goyo<CR>

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>c'

" vim-pandoc
let g:pandoc#biblio#bibs=["/Users/wplai/.zotero/references.bib"]
let g:pandoc#biblio#use_bibtool=1

" fzf
nnoremap <C-p> :<C-u>FZF<CR>

" Grepper
nnoremap <Leader>g :Grepper -tool rg<CR>
nnoremap <Leader>* :Grepper -tool rg -cword -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" LanguageClient {
let g:LanguageClient_serverCommands = {
    \ 'python': ['/Library/Frameworks/Python.framework/Versions/3.8/bin/pyls'],
    \ }
let g:LanguageClient_useVirtualText=0
" use gq to format
function LC_config()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    nnoremap <buffer> <silent> <F1> :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> <Leader>= :call LanguageClient_textDocument_formatting()<CR>
    setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    setlocal signcolumn=yes
  endif
endfunction
" }

" deoplete
if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup md
  autocmd!
  autocmd FileType markdown setlocal et ts=4 sts=4 sw=4
  autocmd FileType markdown setlocal spell spelllang=en_us
  autocmd FileType markdown call deoplete#disable()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup python
  autocmd!
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et colorcolumn=80
  autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'
  autocmd FileType python nnoremap <leader>bk :normal Oimport ipdb; ipdb.set_trace()<ESC>j
  autocmd FileType python nnoremap <leader>r :!python3 %<CR>
  autocmd FileType python call LC_config()  " use LanguageClient
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Golang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup golang
  autocmd!
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup git
  autocmd!
  autocmd FileType gitcommit setlocal spell textwidth=72 colorcolumn=73
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other utilities
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup mac
  autocmd!
  autocmd FileType crontab setlocal nowritebackup
augroup END

augroup vim
  autocmd!
  autocmd FileType vim setlocal sw=2
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
