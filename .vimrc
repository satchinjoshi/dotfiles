call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdTree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'elixir-editors/vim-elixir'
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'vim-ruby/vim-ruby'
" Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/racer'
Plug 'jparise/vim-graphql'
Plug 'elmcast/elm-vim'
Plug 'digitaltoad/vim-pug'
Plug 'LnL7/vim-nix'
Plug 'jvirtanen/vim-hcl'
Plug 'earthly/earthly.vim'
Plug 'chiedo/vim-case-convert'
Plug 'joukevandermaas/vim-ember-hbs'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'joshdick/onedark.vim'

Plug 'rodjek/vim-puppet'

" Plug 'Quramy/tsuquyomi'
" Plug 'leafgarland/typescript-vim'
" Plug 'heavenshell/vim-jsdoc'

Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

call plug#end()

" setlocal spell spelllang=en_us

" Add space after comment
let g:NERDSpaceDelims = 1                 "Add a space after comment

set binary

" Settings for Ale
let g:ale_linters = {}
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 1
let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_list_window_size = 50
let g:ale_terraform_langserver_executable = 'terraform-ls'
" let g:ale_completion_tsserver_autoimport = 1
let g:ale_completion_autoimport = 1
let g:ale_elixir_elixir_ls_release = expand('~/.vim/plugged/vim-elixirls/elixir-ls/release')
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:true } }
let g:ale_linters.elixir = [ 'elixir-ls', 'credo' ]
let g:ale_linters.terraform = [ 'terraform-ls', 'tflint', 'terraform' ]
let g:ale_linters.typescript = [ 'prettier', 'eslint', 'tslint', 'tsserver', 'typecheck' ]
let g:ale_linters.go = ['gofmt', 'golint', 'go vet', 'golangci-lint']
let g:ale_linters.rust = ['analyzer']

augroup AleGroup
  autocmd!
  autocmd User ALELint call TouchOpenFile()
augroup END

func! TouchOpenFile()
    let g:ale_enabled = 0
    sleep 500m
    w
    let g:ale_enabled = 1
endfunc

function ALELSPMappings()
    let l:lsp_found=0
    for l:linter in ale#linter#Get(&filetype) | if !empty(l:linter.lsp) | let l:lsp_found=1 | endif | endfor
    if (l:lsp_found)
        nnoremap <buffer> <C-]> :ALEGoToDefinition<CR>
        nnoremap <buffer> <C-^> :ALEFindReferences<CR>
    else
        silent! unmap <buffer> <C-]>
        silent! unmap <buffer> <C-^>
    endif
endfunction
autocmd BufRead,FileType * call ALELSPMappings()
nnoremap <C-]> :GoDef<CR>

" ======== UltiSnips ==============
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let mapleader = "\<Space>"
let maplocalleader = "\<Space>\<Space>"

set mouse=""
" for vim-ctrlspace
set hidden
set number
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

"Allow for mappings including Esc, while preserving zero timeout after pressing it manually.
set complete-=i
"Set window title by default.
set title
set titleold="Terminal"
set titlestring=%F
"Show the line and column number of the cursor position.
set ruler
"Show white space and tab characters
set list
"Set default whitespace characters when using :set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" -------------- search moving around -----------------
set incsearch                "highlight the search text object
set hlsearch                "highlight search result
map <leader>hh :set hlsearch!<cr>

let g:python3_host_prog = '/opt/homebrew/bin/python3'
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " let g:python_host_prog = '/usr/local/bin/python'
  else
    " let g:python_host_prog = '/usr/bin/python'
    " let g:python3_host_prog = '/usr/bin/python3'
  endif
endif

au BufNewFile,BufRead Jenkinsfile setf groovy
autocmd Filetype groovy setlocal ts=2 sts=2 sw=2

" --------------- NERDTree -------------
let NERDTreeShowHidden=1           "Show hidden file in NERDTree
nmap <leader>op :NERDTreeToggle<CR>
nmap ,m :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype elixir setlocal ts=2 sts=2 sw=2
autocmd Filetype haskell setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescriptreact setlocal ts=2 sts=2 sw=2
autocmd Filetype pug setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
autocmd Filetype proto setlocal ts=2 sts=2 sw=2
" autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2
" autocmd Filetype vue setlocal ts=2 sts=2 sw=2
" autocmd Filetype apiblueprint setlocal ts=3 sts=3 sw=3

au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir

" ======= autoreload rc file on save ========
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" ------------- Reload unchanged files automatically -----------------	
set autoread
au CursorHold * checktime

" ========= Edit & load .vimrc file =======
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>

" =============== FZF config =================
nnoremap <silent> <C-p> :FZF<CR>
set rtp+=~/.fzf " ZFZ Fuzzy finder in go
let g:fzf_source = 'find . -type f | grep -v "node_modules/" | grep -v "\.git/" | grep -v "\.mat$"'

nnoremap <leader>gg :Gstatus<cr>

" ====== Generate ctags ==========
command! Rubyctags execute "Dispatch ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"

" ======= run current file in console =======
nnoremap <leader>rf :call RunFile()<CR>
func! RunFile()
    if &filetype == 'go'
        exec "!go run %:p"
    elseif &filetype == 'ruby'
        exec "!ruby %:p"
    elseif &filetype == 'sh'
        exec "!bash %:p"
    elseif &filetype == 'javascript'
        exec "!node %:p"
    endif
endfunc

" ======= run current file in console =======
nnoremap <leader>ff :call FormatFile()<CR>
func! FormatFile()
    if &filetype == 'elixir'
        exec "!mix format %:p"
    elseif &filetype == 'hcl'
        exec "!terraform fmt %:p"
    elseif &filetype == 'terraform'
        exec "!terraform fmt %:p"
    elseif &filetype == 'typescript'
        exec "!npm run prettier -- -w %"
    elseif &filetype == 'javascript'
        exec "!npm run prettier -- -w %"
    endif
endfunc

" ====== Run unit test ============
nnoremap <leader>rt :call RunTest()<CR>
func! RunTest()
    if &filetype == 'elixir'
        exec "!mix test %:p"
    elseif &filetype == 'ruby'
        exec "!RAILS_ENV=test ruby -I test %:p"
    endif
endfunc

nnoremap <leader>rr :echo cfi#format("%s", "")<CR>

" ====== apply kubernetes config ============
nnoremap <leader>ka :call ApplyK8sConfig()<CR>
func! ApplyK8sConfig()
    if &filetype == 'yaml'
        exec "!kubectl apply -f %:p"
    endif
endfunc
" ====== delete kubernetes config ============
nnoremap <leader>kd :call DeleteK8sConfig()<CR>
func! DeleteK8sConfig()
    if &filetype == 'yaml'
        exec "!kubectl delete -f %:p"
    endif
endfunc

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" -------------- Bubble/Move selected lines -----------
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ------------- Resize buffer -----------------
nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>

" ----------- SAVE -----------------
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>

" --------- netrw settings -------------
let g:netrw_localrmdir="rm -r"                  "delete non empty directory
" let g:netrw_liststyle=3                         "tree style for netrw
nnoremap - :Explore<CR>

set laststatus=0

" ---------- Theme -----------
" set t_Co=256

syntax enable
" set termguicolors
set background=dark
" colorscheme PaperColor
colorscheme onedark
" colorscheme medic_chalk

set exrc

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:fzf_layout = { 'down': '40%' }

let g:go_list_type = "quickfix"
