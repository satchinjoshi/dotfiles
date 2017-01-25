"
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ███████████████████████████
"
"                         ██████████▄▄▄▄▄▄▄██████████
"   You are about to experience a potent dosage of Vim. Watch your steps.
"
"                ╔══════════════════════════════════════════╗
"                ║           ⎋ HERE BE VIMPIRES ⎋           ║
"                ╚══════════════════════════════════════════╝

call plug#begin()

Plug 'beloglazov/vim-online-thesaurus', { 'on': ['Thesaurus', 'OnlineThesaurusCurrentWord'] }
" version control
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Languages/support
Plug 'pearofducks/ansible-vim'
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'

Plug 'sheerun/vim-polyglot'
if has('nvim')
    Plug 'Shougo/deoplete.nvim',    { 'do': ':UpdateRemotePlugins' }
endif
Plug 'mhinz/vim-startify'

Plug 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1

Plug 'kshenoy/vim-signature'
Plug 'dhruvasagar/vim-table-mode'

Plug 'hashivim/vim-hashicorp-tools'

"===================== elixir && phoenix ===============================
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features
"=============================================================
Plug 'stephpy/vim-yaml'
Plug 'metakirby5/codi.vim'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'tpope/vim-rails'
Plug 'evidens/vim-twig'
Plug 'derekwyatt/vim-scala'
Plug 'jwalton512/vim-blade'
Plug 'alvan/vim-php-manual'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'sumpygump/php-documentor-vim'
" Navigation
Plug 'brooth/far.vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'miyakogi/seiya.vim'
let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']

" ColorScheme
Plug 'joshdick/onedark.vim'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim' }

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"========Async======
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'

call plug#end()

set mouse=""

set title

let mapleader = "\<Space>"
let maplocalleader = "\<Space>\<Space>"

set encoding=utf-8

" for vim-ctrlspace
set hidden

"Theme
syntax enable
set termguicolors
set background=dark

if $TERM == "xterm-256color"
    set t_Co=256
endif

set number
set relativenumber
set backspace=indent,eol,start        "Allow backspace in insert mode.
set smartcase
set ignorecase
set cursorline                "highlight current line
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set scrolloff=5

set path+=**

" folding settings
set foldmethod=indent            " fold based on indent
set foldnestmax=10              " deepest fold is 10 levels
set nofoldenable              " dont fold by default
set foldlevel=1                " this is just what i use

" Tabs n indent
set nowrap
set autoindent                " on new lines, match indent of previous line
set copyindent                " copy the previous indentation on autoindenting
set cindent                  " smart indenting for c-like code
set expandtab                " Tabs are spaces, not tabs
"set smarttab
set tabstop=4                " tab size
set shiftwidth=4
set shiftround
set softtabstop=4

filetype plugin indent on

autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype blade setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype elixir setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2
autocmd Filetype scala setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2

"Allow for mappings including Esc, while preserving zero timeout after pressing it manually.
set complete-=i

"Disable swap to prevent annoying messages.
set noswapfile

"Set window title by default.
set title

"Show the line and column number of the cursor position.
set ruler

"Show white space and tab characters
set list
"Set default whitespace characters when using :set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" search moving around
set incsearch                "highlight the search text object
set hlsearch                "highlight search result
map <leader>hh :set hlsearch!<cr>

"Reload unchanged files automatically.
set autoread
au CursorHold * checktime

"---------------- autoreload rc file on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"------------------------- FZF config ----------------------------------
" Fuzzy search on CTRL P
nnoremap <silent> <C-p> :FZF<CR>
set rtp+=~/.fzf " ZFZ Fuzzy finder in go
let g:fzf_source = 'find . -type f | grep -v "node_modules/" | grep -v "\.git/" | grep -v "\.mat$"'

"---------------------------- Syntastic config -------------------------
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list = 2
" let g:syntastic_auto_loc_list = 1                         "error list
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_phpcs_disable = 1
let g:syntastic_php_checkers = ['php']
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
        " No location/quickfix list shown, open syntastic error location panel
        Errors
    else
        lclose
    endif
endfunction
nnoremap <silent> <A-e> :<C-u>call ToggleErrors()<CR>

"----------------------------- Fugitive Config ------------------------
nnoremap gs :Gstatus <CR>
nnoremap gd :Gdiff <CR>
nnoremap gc :Gcommit <CR>
nnoremap gb :Gblame <CR>
nnoremap gl :Glog -- %<CR>

" push to current branch
function! PullFromCurrentBranch()
  let branch = fugitive#statusline()
  let branch = substitute(branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.' \1', 'g')
  execute "Dispatch git pull origin" . branch
endfunction

" push to current branch
function! PushToCurrentBranch()
  let branch = fugitive#statusline()
  let branch = substitute(branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.' \1', 'g')
  execute "Dispatch git push origin" . branch
endfunction

" Map gwp keys to call the function
nnoremap gwp :call PushToCurrentBranch()<CR>
nnoremap grp :call PullFromCurrentBranch()<CR>

"-------------------- MAP the previous/next error -------------------------
nnoremap <silent> ,en :lnext<CR>
nnoremap <silent> ,ep :lprev<CR>

"------------------- Edit & load .vimrc file -----------------------------
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>

"------------------- Edit & load .zshrc file -----------------------------
noremap <leader>ez :tabe ~/.zshrc<cr>

"------------------- Edit & load .zshrc file -----------------------------
nnoremap <leader>et :tabe ~/.tmux.conf<cr>

" Clean Swap files
command! Cleanswapdir exec "Dispatch rm -rf ~/.config/nvim/swap/"

" .po to .mo compilation
nnoremap <leader>mo :call CompilePoToMo()<CR>
func!  CompilePoToMo()
    if &filetype == 'po'
        exec "!msgfmt %:p -o %:p:h/messages.mo"
    endif
endfunc

" Generate php docs
au BufRead,BufNewFile *.php inoremap <buffer> <leader>pd :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <leader>pd :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <leader>pd :call PhpDocRange()<CR>

"------------------------- PHP Namespaces Import
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>

"--------------------------- Expand Namespace
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pe <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pe :call PhpExpandClass()<CR>

"-------------------------- Laravel specific
function! Artisan()
    let command = input('Enter artisan command: ')
    if command != ""
        exec "!php artisan " . command
    else
        exec "!php artisan"
    endif
endfunction
nnoremap <leader>la :call Artisan()<cr>

function! L52RouteList()
    let name = input('Enter route regex: ')
    if name != ""
        execute "!php artisan route:list | grep " . name
    else
        execute "!php artisan route:list"
    endif
endfunction
nnoremap <leader>lrl :call L52RouteList()<CR>

command! L52ViewClear exec "Dispatch php artisan view:clear"
command! L52ConfigClear exec "Dispatch php artisan config:clear"
command! L52CacheClear exec "Dispatch php artisan cache:clear"

nnoremap <leader>lvc :L52ViewClear<CR>

"----------------------------- run current file in console
nnoremap <leader>rf :call RunFile()<CR>
func! RunFile()
    if &filetype == 'php'
        exec "!php %:p"
    elseif &filetype == 'go'
        <ESC>:!go run %:p
    elseif &filetype == 'sh'
        exec "!bash %:p"
    elseif &filetype == 'elixir'
        exec "!elixir %"
    elseif &filetype == 'javascript'
        exec "!node %:p"
    endif
endfunc

command! Google exec "!xdg-open http://www.google.com"

"--------------------------- run gulp
nnoremap <leader>gg :call RunGulp() <CR>
func! RunGulp()
    execute "Dispatch gulp"
endfunc

"------------------------- run current php file in console
nnoremap <leader>rf :call RunFile()<CR>
func! RunFile()
    if &filetype == 'php'
        exec "Dispatch php %:p"
    endif
    if &filetype == 'go'
        exec "Dispatch go run %:p"
    endif
    if &filetype == 'sh'
        exec "%:p"
    endif
endfunc

"--------------------------- Generate ctags
command! Ctags execute "Dispatch ctags -R --fields=+aimS --languages=php"

"--------------------------- Run phpunit
nnoremap <leader>rt :call RunUnitTest()<CR>
func! RunUnitTest()
    if &filetype == 'php'
        exec "Dispatch ./vendor/bin/phpunit"
    endif
    if &filetype == 'elixir'
        exec "Dispatch mix test"
    endif
endfunc

"-------------------------- CodeCeption
nnoremap <leader>crf :call RunCodeception()<CR>
func! RunCodeception()
    execute "Dispatch ./vendor/bin/codecept run functional %:t"
endfunc

"-------------------------- Run Elixir Test
nnoremap <leader>mt :call RunElixirTest()<CR>
func! RunElixirTest()
    exec "!mix test %:p"
endfunc


nmap <leader>pc :e composer.json<CR>

" fix coding standar for current file to psr2
nnoremap <leader>csf :call CSFixer()<CR>
func! CSFixer()
    if &filetype == 'php'
        exec "!vendor/bin/php-cs-fixer --verbose fix %:p --config=.php_cs"
    endif
endfunc

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Bubble/Move single lines
nmap <C-k> [e
nmap <C-j> ]e

"Bubble/Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Resize buffer
nnoremap <A-h> :vertical resize -5<cr>
nnoremap <A-j> :resize +5<cr>
nnoremap <A-k> :resize -5<cr>
nnoremap <A-l> :vertical resize +5<cr>

" SAVE
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>

"refresh buffer
nnoremap <C-r> :e!<CR>

" Destroy Buffer
map <A-q> :bd<CR>
nnoremap <leader>q :bd<CR>

" Refresh buffer
nnoremap <leader>r :e!<CR>

" set filetype for ractive template for pagevamp
autocmd BufNewFile,BufRead *.js.twig   set syntax=javascript
autocmd BufNewFile,BufRead *.twig   set syntax=twig
"autocmd BufNewFile,BufRead *.blade.php   set filetype=html

"------------------------------------ netrw settings -----------------------------------
let g:netrw_localrmdir="rm -r"                  "delete non empty directory
" let g:netrw_liststyle=3                         "tree style for netrw
nnoremap - :Explore<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"use tabe for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set laststatus=0

nnoremap <leader>o :only<CR>

"-------------------------------------- UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_parse_docblock_comments = 1

"----------------------------- NERDTREE CONFIG ------------------------
let NERDTreeShowHidden=1           "Show hidden file in NERDTree
nmap ,m :NERDTreeTabsToggle<CR>
nmap ,n :NERDTreeTabsFind<CR>

"----------------------------- Emmet Remap ------------------------
let g:user_emmet_leader_key='<C-l>'

"----------------------------- Theme bug fix / Always load the theme at last
"--------------------------- Or the color schema seems off----------------------
colorscheme apprentice

"Elixir/Phoenix Setting
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
let g:alchemist_iex_term_split = 'split'

"Move cursor out for neovim terminal
if has('nvim')
:tnoremap <Esc> <C-\><C-n><C-w><C-w>
endif

"Show IEx
nnoremap <leader>ex :IEx<CR>

"Auto Remove White Space
autocmd BufWritePre * %s/\s\+$//e

"convert tabs to Space
command! Tabstospace %s/\t/  /g

"Auto Format JS file as per "standard
autocmd bufwritepost *.js silent !standard --fix %

