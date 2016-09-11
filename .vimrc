call plug#begin()

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Languages/support
"===================== elixir ===============================
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
"=============================================================
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'evidens/vim-twig'
Plug 'derekwyatt/vim-scala'
Plug 'jwalton512/vim-blade'
Plug 'alvan/vim-php-manual'
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'sumpygump/php-documentor-vim'
" Navigation
Plug 'skwp/greplace.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Note
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'noah/vim256-color'
Plug 'joshdick/onedark.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-unimpaired'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"========Async======
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'

"========= Tmux =======
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let mapleader = "\<Space>"
let maplocalleader = "\<Space>\<Space>"

" for vim-ctrlspace
set hidden

"Theme
syntax enable
set termguicolors
colorscheme seoul256
"colorscheme onedark
set background=dark

set number
set relativenumber
set backspace=indent,eol,start				"for making backspace behave like normal editor
set smartcase
set ignorecase
set cursorline								"highlight current line
set backupdir=~/.config/nvim/backup//	
set directory=~/.config/nvim/swap//
set scrolloff=5

" folding settings
set foldmethod=indent						" fold based on indent
set foldnestmax=10							" deepest fold is 10 levels
set nofoldenable							" dont fold by default
set foldlevel=1								" this is just what i use

" Tabs n indent 
set nowrap
set autoindent								" on new lines, match indent of previous line
set copyindent								" copy the previous indentation on autoindenting
set cindent									" smart indenting for c-like code
set expandtab								" Tabs are spaces, not tabs
set smarttab        
set tabstop=4								" tab size
set shiftwidth=4
set shiftround
set softtabstop=4

" search moving around 
set incsearch								"highlight the search text object
set hlsearch								"highlight search result
map <leader>hh :set hlsearch!<cr> 

" Auto load file changes
" changes are seen when changing buffer, live reload
" not working
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
let g:syntastic_javascript_checkers=['']
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

"-------------------------- Deploy by Envoy
command! Edeploy exec "Dispatch envoy run deploy"
nnoremap edp :Edeploy<CR>

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
        exec "Dispatch go run %:p"
    elseif &filetype == 'sh'
        exec "Dispatch .%:p"
    elseif &filetype == 'elixir'
        exec "Dispatch elixir %:p"
    elseif &filetype == 'javascript'
        exec "Dispatch node %:p"
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
nnoremap <leader>tt :call GenerateCtags()<CR>
func! GenerateCtags()
    execute "Dispatch ctags -R --fields=+aimS --languages=php"
endfunc

"--------------------------- Run phpunit
nnoremap <leader>rt :call RunPHPunit()<CR>
func! RunPHPunit()
    exec "Dispatch ./vendor/bin/phpunit"
endfunc

nmap <leader>pc :e composer.json<CR>

" fix coding standar for current file to psr2
nnoremap <leader>csf :call CSFixer()<CR>
func! CSFixer()
    if &filetype == 'Xphp'
        exec "!phpcbf --standard=psr2 %:p"
    endif
    if &filetype == 'php'
        exec "!php-cs-fixer --verbose fix %:p --config-file=.php_cs"
    endif
endfunc

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

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
" Buffer destroy
nnoremap <A-r> :BuffergatorToggle<CR>
" set filetype for ractive template for pagevamp
autocmd BufNewFile,BufRead *.js.twig   set syntax=javascript
autocmd BufNewFile,BufRead *.twig   set syntax=twig
"autocmd BufNewFile,BufRead *.blade.php   set filetype=html

"------------ Greplace -------------------
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"------------------------------------ netrw settings -----------------------------------
let g:netrw_localrmdir="rm -r"                  "delete non empty directory
" let g:netrw_liststyle=3                         "tree style for netrw 
nnoremap - :Explore<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"---------- Lightline confg -----------------------
set laststatus=0
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }


nnoremap <leader>o :only<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A>h :TmuxNavigateLeft<cr>
nnoremap <silent> <A>j :TmuxNavigateDown<cr>
nnoremap <silent> <A>k :TmuxNavigateUp<cr>
nnoremap <silent> <A>l :TmuxNavigateRight<cr>
nnoremap <silent> <A>p :TmuxNavigatePrevious<cr>

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
let NERDTreeShowHidden=1 					"Show hidden file in NERDTree
nmap ,m :NERDTreeToggle<CR> 
nmap ,n :NERDTreeFind<CR> 

"----------------------------- Emmet Remap ------------------------
let g:user_emmet_leader_key='<C-l>'

"----------------------------- Theme bug fix ----------------------
"autocmd BufReadPre,FileReadPre * :set colorscheme onedark

