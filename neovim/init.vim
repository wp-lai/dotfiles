"
"  __   _(_)_ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"    \_/ |_|_| |_| |_|_|  \___|
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Essential
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=1
set mouse=a
set scrolloff=5
set ignorecase   " Ignore case when searching
set smartcase    " Don't ignore case when search has capital letter
set nojoinspaces " prevents insert two space after punctuation
set hidden       " Allow buffer switching without saving
set showmatch    " show matching brakets/parenthesis
set relativenumber
set splitbelow
set splitright
set nowrap

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
map <Space> <leader>

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

inoremap <C-U> <C-G>u<C-U>

" use w!! to save files with sudo
cmap w!! w !sudo tee > /dev/null %

" Fix the & command (repeat last substitute)
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if isdirectory($VIMCONFIG . "/pack/minpac/start/vim-gruvbox8")
"     colorscheme gruvbox8_hard
" endif

if isdirectory($VIMCONFIG . "/pack/minpac/start/nord-vim")
    colorscheme nord
endif

" True color support
if (has("termguicolors"))
  set termguicolors
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install minpac first
" git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
function! PackInit() abort
  packadd minpac
  call minpac#init({'verbose': 3})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " utilities
  call minpac#add('bronson/vim-trailing-whitespace') " highlight trailing whitespace
  call minpac#add('tpope/vim-unimpaired')            " Pairs of handy bracket mappings
  call minpac#add('tpope/vim-commentary')            " gc to comment/uncomment
  call minpac#add('tpope/vim-surround')            " ds/cs to delete/change surroundings
  call minpac#add('google/vim-searchindex')        " display search index
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('Valloric/ListToggle')           " easy toggle quickfix/location list
  call minpac#add('junegunn/vim-easy-align')       " easy align text

  " style
  call minpac#add('junegunn/goyo.vim')             " distract-free mode
  call minpac#add('mhinz/vim-startify')            " fancy start screen
  call minpac#add('machakann/vim-highlightedyank') " highlight yank text

  " theme
  call minpac#add('lifepillar/vim-gruvbox8')
  call minpac#add('arcticicestudio/nord-vim')
  " call minpac#add('morhetz/gruvbox')

  " lint
  " call minpac#add('dense-analysis/ale')

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

  " code completion
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

  " R
  call minpac#add('jalvesaq/Nvim-R')
  call minpac#add('chrisbra/csv.vim')

  " document: Dash
  call minpac#add('rizzatti/dash.vim')

  " testing
  " call minpac#add('janko/vim-test')

  " Chinese input
  " call minpac#add('rlue/vim-barbaric')
  " call minpac#add('ybian/smartim')
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
nnoremap <silent> <leader>z :Goyo<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>c'

" vim-pandoc
let g:pandoc#biblio#bibs        = ["/Users/wplai/.zotero/references.bib"]
let g:pandoc#biblio#use_bibtool = 1

" fzf
nnoremap <C-p> :<C-u>FZF<CR>

" Grepper
nnoremap <Leader>gg :Grepper -tool rg<CR>
nnoremap <Leader>* :Grepper -tool rg -cword -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" gitgutter
set updatetime=300

" dash
nmap <silent> <leader>d <Plug>DashSearch<CR>

" Nvim-R
" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1
" R commands in R output are highlighted
let g:Rout_more_colors = 1
" press -- to have Nvim-R insert the assignment operator: <-
let R_assign_map = "--"
" make sure the console is at the bottom by making it really wide
" let R_rconsole_width = 1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <F1> to trigger completion.
inoremap <silent><expr> <C-\> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

augroup cocgroup
  autocmd!
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" " nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold   :call CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>ga  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ge  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>gc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>go  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>gs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>gj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>gk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>gp  :<C-u>CocListResume<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup md
  autocmd!
  autocmd FileType markdown,text,rmd setlocal et ts=4 sts=4 sw=4
  autocmd FileType markdown,text,rmd setlocal spell spelllang=en_us
  autocmd FileType markdown,text,rmd setlocal wrap linebreak showbreak=↪
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog="/Library/Frameworks/Python.framework/Versions/3.8/bin/python3"
augroup python
  autocmd!
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et colorcolumn=80
  autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'
  autocmd FileType python nnoremap <leader>bk :normal Oimport ipdb; ipdb.set_trace()<ESC>j
  autocmd FileType python nnoremap <leader>r :!python3 %<CR>
  " autocmd FileType python call LC_config()
  " autocmd FileType python call ncm2#enable_for_buffer()
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
" => R
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup rstat
  autocmd!
  " autocmd FileType r,rmd call ncm2#enable_for_buffer()
  autocmd FileType r setlocal et ts=2 sts=2 sw=2
  " autocmd FileType r call LC_config()
  autocmd FileType r,rmd nmap , <Plug>RDSendLine
  autocmd FileType r,rmd vmap , <Plug>RDSendSelection
  autocmd FileType r,rmd vmap ,e <Plug>RESendSelection
  autocmd FileType r,rmd inoremap <buffer> >> <Esc>:normal! a %>% <CR>a
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other utilities
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup mygroup
  autocmd!
  autocmd FileType crontab setlocal nowritebackup
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

augroup Vim
  autocmd!
  autocmd FileType vim setlocal sw=2
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  " make comments italic
  autocmd VimEnter * highlight Comment cterm=italic gui=italic
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
