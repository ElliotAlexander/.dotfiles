set encoding=utf8

call plug#begin('~/.vim/plugged')

" Nerd Tree
Plug 'scrooloose/nerdtree',{ 'on':  'NERDTreeToggle' }

" Visual tweaks
Plug 'morhetz/gruvbox'

Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'

" Linting setup
Plug 'Shougo/deoplete.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/denite.nvim'
Plug 'edkolev/tmuxline.vim'
Plug 'dense-analysis/ale'
Plug 'HerringtonDarkholme/yats.vim'

" Fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'

" Node
Plug 'neovim/node-host'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}

"Quality of life
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch' " Unix commands in vim
Plug 'airblade/vim-gitgutter' 
Plug 'dkprice/vim-easygrep'
Plug 'HendrikPetertje/vimify'

" Git
Plug 'tpope/vim-fugitive'
Plug 'kablamo/vim-git-log'

"  Markdown
Plug 'tpope/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'jtratner/vim-flavored-markdown'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" No swap files
set noswapfile
set nobackup
set nowb
         
" Autoreload files when changed
set autoread

" Completion ignore paths

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=**/node_modules/** 


let g:deoplete#enable_at_startup = 1
let g:node_host_prog = '/usr/lib/node_modules/neovim-node-host'

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


call plug#end()

colorscheme gruvbox

" Terminal Colours Setup 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
filetype indent plugin on

" Mouse setup
set number
set mouse=a

" Search tweaks
"
"
set incsearch       
set hlsearch       
set ignorecase     
set smartcase     

" no arrows <3 
let g:elite_mode=1

" Theme setup
set background=dark

"Enable syntax highlighting
syntax on

" Always start NerdTree
autocmd VimEnter * NERDTree


" Aliases
"
" Map tab switching to CTRL + numbers
map <silent> <D-1> :tabn 1<cr>

" Map colon to semi-colon
nmap ; :

" Map semi-colon to Files
map ; :Files<CR>
map <A-;> :Ag<CR>

" Map Ctrl-O to nerdtree toggle
map <C-o> :NERDTreeToggle<CR>


map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Multiple cursor bindings
nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv


" Markdown Syntax Support
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
 augroup END

" Grep improvements
command! -nargs=* Search :vimgrep /<q-args>/ **/*
let g:ackprg = 'ag --nogroup --nocolor --column'

" Use two spaces for tabs.
filetype plugin indent on
set tabstop=4
set shiftwidth=3
set expandtab


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Perl Critic
let g:ale_perl_perl_executable = 'perl'
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_perl_perlcritic_executable = 'perlcritic'
let g:ale_perl_perlcritic_options = ''
let g:ale_perl_perlcritic_profile = '.perlcriticrc'
let g:ale_perl_perlcritic_showrules = 1

" Ale linting
let g:ale_linters = { 
         \ 'javascript': ['standard', 'prettier', 'eslint'], 
         \ 'css': ['stylelint','prettier'],
         \ 'typescript': ['standard', 'prettier', 'eslint'],
         \ 'perl': ['perl', 'perlcritic', 'perltidy'], }

" Use eslint
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier'],
 \ 'typescript': ['eslint', 'prettier'],
 \ 'sass': ['prettier'],
 \ 'perl': ['perltidy', 'perlcritic'],
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
" Perl critic setup
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
"le_perl_perl_options = '-c -Mwarnings -Ilib -It/lib' Display perl critic violations as errors
let g:ale_type_map = {
\ 'perlcritic': {'ES': 'WS', 'E': 'W'},
\}

" Rainbow
let g:rainbow_active = 1


" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
 endfunction

 noremap <leader>ss :call StripWhitespace()<CR>
