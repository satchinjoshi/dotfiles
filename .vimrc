let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin()

Plug 'chiedo/vim-case-convert'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'

Plug 'tyru/current-func-info.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim',    { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
endif
Plug 'mhinz/vim-startify'

Plug 'kshenoy/vim-signature'
Plug 'dhruvasagar/vim-table-mode'

Plug 'hashivim/vim-hashicorp-tools'

" ======== elixir && phoenix ============
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Plug 'c-brenn/phoenix.vim'
" Plug 'tpope/vim-projectionist' " required for some navigation features
Plug 'powerman/vim-plugin-AnsiEsc'
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
let g:alchemist_iex_term_split = 'split'
let g:alchemist_tag_map = '<C-]>'
nnoremap <leader>ex :IEx<CR>

Plug 'ekalinin/Dockerfile.vim'
autocmd BufNewFile,BufRead *.docker   set syntax=dockerfile

Plug 'metakirby5/codi.vim'
Plug 'posva/vim-vue'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'vimwiki/vimwiki'

Plug 'jwalton512/vim-blade'

Plug 'alvan/vim-php-manual'
Plug 'arnaud-lb/vim-php-namespace'
" ------ PHP Namespaces Import -------------
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>
" ---------- Expand Namespace ---------------
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pe <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pe :call PhpExpandClass()<CR>

Plug 'sumpygump/php-documentor-vim'
au BufRead,BufNewFile *.php inoremap <buffer> <leader>pd :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <leader>pd :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <leader>pd :call PhpDocRange()<CR>

Plug 'rking/ag.vim'
" =============== FZF config =================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
nnoremap <silent> <C-p> :FZF<CR>
set rtp+=~/.fzf " ZFZ Fuzzy finder in go
let g:fzf_source = 'find . -type f | grep -v "node_modules/" | grep -v "\.git/" | grep -v "\.mat$"'

" ColorScheme
Plug 'joshdick/onedark.vim'

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1                 "Add a space after comment

Plug 'editorconfig/editorconfig-vim'

" ========== Neomake =============
Plug 'neomake/neomake' | Plug 'dojoteef/neomake-autolint'
let g:neomake_verbose=3
let g:neomake_place_signs = 1
" let g:neomake_open_list = 2
let g:neomake_php_phpcs_args_standard='PSR2'

Plug 'terryma/vim-multiple-cursors'

" ======== UltiSnips ==============
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ======== Async =============
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-sensible'

call plug#end()

let mapleader = "\<Space>"
let maplocalleader = "\<Space>\<Space>"

if $TERM == "xterm-256color"
    set t_Co=256
endif

set mouse=""
" for vim-ctrlspace
set hidden
"Theme
syntax enable
set termguicolors
set background=dark
set number
" set relativenumber
set backspace=indent,eol,start        "Allow backspace in insert mode.
set smartcase
set ignorecase
set cursorline                "highlight current line

" ======== Scrolling =============
set scrolloff=8                 " Scroll when 8 lines away from margins
set sidescrolloff=15            " How near the cursor must come to the border
set sidescroll=3

" ===== Handling Files ==========
set encoding=utf-8              " UTF-8 Encoding to avoid server issues
set noswapfile                  " Avoid using Swap Files. Text is in memory
set nobackup                    " Prevent Backup files
set nowb                        " Prevent Backup files
set history=1000                " Amount of :cmdline history
set path+=**

" ======= folding settings =========
set foldmethod=indent            " fold based on indent
set foldnestmax=10              " deepest fold is 10 levels
set nofoldenable              " dont fold by default
set foldlevel=1                " this is just what i use

" ========= Tabs n indent ==============
set nowrap
set autoindent                " on new lines, match indent of previous line
set copyindent                " copy the previous indentation on autoindenting
set cindent                  " smart indenting for c-like code
set expandtab                " Tabs are spaces, not tabs

" ======== set smarttab ================
set tabstop=4                " tab size
set shiftwidth=4
set shiftround
set softtabstop=4

filetype plugin indent on

autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype blade setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
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

" Reload unchanged files automatically.
set autoread
au CursorHold * checktime

" ======= autoreload rc file on save ========
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" ========= Edit & load .vimrc file =======
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>

" ====== Generate ctags ==========
command! Phpctags execute "Dispatch ctags -R --fields=+laimS --languages=php"
command! Rubyctags execute "Dispatch ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"

" ======= run current file in console =======
nnoremap <leader>rf :call RunFile()<CR>
func! RunFile()
    if &filetype == 'php'
        exec "!php %:p"
    elseif &filetype == 'go'
        exec "!go run %:p"
    elseif &filetype == 'ruby'
        exec "!ruby %:p"
    elseif &filetype == 'sh'
        exec "!bash %:p"
    elseif &filetype == 'elixir'
        exec "!elixir -r %:p"
    elseif &filetype == 'javascript'
        exec "!node %:p"
    endif
endfunc
" ====== Run unit test ============
nnoremap <leader>rt :call RunTest()<CR>
func! RunTest()
    if &filetype == 'php'
        if cfi#format('%s', '') == ''
            exec "Start ./vendor/bin/phpunit --filter %:t:r %"
        else
            exec "Start ./vendor/bin/phpunit --filter ".cfi#format('%s', '')." %"
        endif
    elseif &filetype == 'elixir'
        exec "Start mix test"
    endif
endfunc

nnoremap <leader>rr :echo cfi#format("%s", "")<CR>

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

" set filetype for ractive template for pagevamp
autocmd BufNewFile,BufRead *.js.twig   set syntax=javascript
autocmd BufNewFile,BufRead *.twig   set syntax=twig
"autocmd BufNewFile,BufRead *.blade.php   set filetype=html

" --------- netrw settings -------------
let g:netrw_localrmdir="rm -r"                  "delete non empty directory
" let g:netrw_liststyle=3                         "tree style for netrw
nnoremap - :Explore<CR>

set laststatus=0

" Use gruvbox's termcolors
"
" @see https://github.com/ianks/gruvbox/blob/c7b13d9872af9fe1f5588d6ec56759489b0d7864/colors/gruvbox.vim#L137-L169
" @see https://github.com/morhetz/gruvbox/pull/93/files
function! s:SetTerminalColors() abort
  " dark0 + gray
  let g:terminal_color_0 = '#282828'
  let g:terminal_color_8 = '#928374'

  " neurtral_red + bright_red
  let g:terminal_color_1 = '#cc241d'
  let g:terminal_color_9 = '#fb4934'

  " neutral_green + bright_green
  let g:terminal_color_2 = '#98971a'
  let g:terminal_color_10 = '#b8bb26'

  " neutral_yellow + bright_yellow
  let g:terminal_color_3 = '#d79921'
  let g:terminal_color_11 = '#fabd2f'

  " neutral_blue + bright_blue
  let g:terminal_color_4 = '#458588'
  let g:terminal_color_12 = '#83a598'

  " neutral_purple + bright_purple
  let g:terminal_color_5 = '#b16286'
  let g:terminal_color_13 = '#d3869b'

  " neutral_aqua + faded_aqua
  let g:terminal_color_6 = '#689d6a'
  let g:terminal_color_14 = '#8ec07c'

  " light4 + light1
  let g:terminal_color_7 = '#a89984'
  let g:terminal_color_15 = '#ebdbb2'
endfunction
call s:SetTerminalColors()

"----------------------------- Theme bug fix / Always load the theme at last
"--------------------------- Or the color schema seems off----------------------
colorscheme onedark

"Move cursor out for neovim terminal
if has('nvim')
:tnoremap <Esc> <C-\><C-n><C-w><C-w>
endif

"Auto Remove White Space
autocmd BufWritePre * %s/\s\+$//e

"convert tabs to Space
command! Tabstospace %s/\t/  /g

"Auto Format JS file as per "standard
" autocmd bufwritepost *.js silent !standard --fix %
"
:nmap <leader>ll m`b~``
