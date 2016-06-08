call plug#begin()

" Languages/support
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'evidens/vim-twig'
Plug 'derekwyatt/vim-scala'
Plug 'alvan/vim-php-manual'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'sumpygump/php-documentor-vim'
" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdTree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Misc
Plug 'gosukiwi/vim-atom-dark'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/vim-easy-align'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'terryma/vim-multiple-cursors'
Plug 'garbas/vim-snipmate' | Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'honza/vim-snippets'

call plug#end()

let mapleader = "\<Space>"

"Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme atom-dark-256
set background=dark

set laststatus=0                            "no status line
set number
set relativenumber
set backspace=indent,eol,start				"for making backspace behave like normal editor
set smartcase
set ignorecase
set cursorline								"highlight current line
set backupdir=~/.config/nvim/backup//	
set directory=~/.config/nvim/swap//

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

" ignore files 
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
set wildignore+=*.zip,*.rar,*.gz,*.png,*.gif,*.jpg,*.mo,*.bat

nnoremap <silent> <C-p> :FZF<CR>

" "---------------------------- neomake config ------------------------------
" set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
" autocmd! BufWritePost,BufEnter * Neomake
" let g:neomake_place_signs = 1
" let g:neomake_open_list = 2
" let g:neomake_php_enabled_makers = ['php']
" let g:neomake_html_enabled_makers = []
" let g:neomake_javascript_enabled_makers = []

"---------------------------- Syntastic config -------------------------
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list = 2
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
let g:syntastic_javascript_checkers=['']
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

"----------------------------- Fugitive Config ------------------------
nnoremap <leader>gs :Gstatus <CR>
nnoremap <leader>gd :Gdiff <CR>
nnoremap <leader>gc :Gcommit <CR>

"----------------------------- NERDTREE CONFIG ------------------------
let NERDTreeShowHidden=1 					"Show hidden file in NERDTree
nmap ,m :NERDTreeToggle<CR> 
nmap ,n :NERDTreeFind<CR> 

"-------------------- MAP the previous/next error -------------------------
nnoremap <silent> ,en :lnext<CR>
nnoremap <silent> ,ep :lprev<CR>

"------------------- Edit & load .vimrc file -----------------------------
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>oo :source $MYVIMRC<cr>
nnoremap <leader>eu :tabe ~/.config/nyaovim/nyaovimrc.html<cr>

"------------------- Edit & load .vimrc file -----------------------------
nnoremap <leader>ez :tabe ~/.zshrc<cr>

"---------------------------- Toggle relativenumber --------------------"
nnoremap <leader>n :call NumberToggle()<cr>

function! NumberToggle()
  if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
  endif
endfunc

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

" PHP Namespaces Import
function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>

" Expand Namespace
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pe <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pe :call PhpExpandClass()<CR>

" run current file in console
nnoremap <leader>rf :call RunFile()<CR>
func! RunFile()
	if &filetype == 'php'
		exec "!php %:p"
    elseif &filetype == 'go'
		exec "!go run %:p"
    endif &filetype == 'sh'
		exec "!.%:p"
    endif &filetype == 'javascript'
		exec "!node %:p"
	endif
endfunc

command! Google exec "!xdg-open http://www.google.com"

" run current php file in console
nnoremap <leader>rf :call RunFile()<CR>
func! RunFile()
	if &filetype == 'php'
		exec "!php %:p"
	endif
	if &filetype == 'go'
		exec "!go run %:p"
	endif
	if &filetype == 'sh'
	    exec "%:p"
    endif
endfunc

" Generate ctags
nnoremap <leader>T :call GenerateCtags()<CR>
func! GenerateCtags()
	exec "!ctags -R --fields=+aimS --languages=php"
endfunc

" Run phpunit
nnoremap <leader>rt :call RunPHPunit()<CR>
func! RunPHPunit()
	exec "!./vendor/bin/phpunit"
endfunc

nmap <leader>pc :e composer.json<CR>

" fix coding standar for current file to psr2
nnoremap <leader>csf :call CSFixer()<CR>
func! CSFixer()
	if &filetype == 'php'
		exec "!php-cs-fixer fix %:p --level=psr2"
	endif
endfunc

nnoremap <leader>da :call ComposerDumpAutoLoad()<CR>
func! ComposerDumpAutoLoad()
    exec "!composer dumpautoload -o"
endfunc

" Edit laravel route file
nmap <leader>lr :e app/Http/routes.php<CR>

" For blade comment
autocmd FileType php  nnoremap <leader>lc I{{--<esc>A--}}<esc>

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

"Type 12<Enter> to go to line 12 (12G breaks my wrist)
nnoremap <CR> G

"Resize buffer
nnoremap <C-h> :vertical resize -5<cr>
" nnoremap <C-j> :resize +5<cr>
" nnoremap <C-k> :resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>

" SAVE
nnoremap <c-s> :w<CR> " normal mode: save
inoremap <c-s> <Esc>:w<CR>l " insert mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> " visual mode: escape to normal and save

" set filetype for ractive template for pagevamp
autocmd BufNewFile,BufRead *.js.twig   set syntax=javascript
autocmd BufNewFile,BufRead *.twig   set syntax=twig

" ZFZ Fuzzy finder in go
set rtp+=~/.fzf

" set list                " Show problematic characters.

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>tt :terminal <CR>

let g:php_cs_fixer_level = "psr2" 
let g:php_cs_fixer_config_file = '.php_cs'
