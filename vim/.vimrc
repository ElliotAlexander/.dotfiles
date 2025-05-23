nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
set encoding=utf8


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Nerd Tree
Plug 'scrooloose/nerdtree',{ 'on':  'NERDTreeToggle' }

" Visual tweaks
Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'

" Powerpoints
Plug 'dhruvasagar/vim-marp'

Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'ntpeters/vim-better-whitespace'

" Linting setup
Plug 'HerringtonDarkholme/yats.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'dense-analysis/ale'
Plug 'google/vim-jsonnet'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-packer'

" Fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Node
Plug 'neovim/node-host'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}

"Quality of life
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch' " Unix commands in vim
Plug 'airblade/vim-gitgutter'
Plug 'dkprice/vim-easygrep'
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'
Plug 'kablamo/vim-git-log'

"  Markdown
Plug 'tpope/vim-markdown'

" Latex support
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

let g:coc_disable_startup_warning = 1

"
" Options
"
"

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

" line numbering system setup
:set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Split to the left and right
set splitbelow splitright

" Latex setup
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

let g:node_host_prog = '/usr/lib/node_modules/neovim-node-host'

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
let g:ackprg = 'ag --nogroup --nocolor --column'

" Prettier nerd
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Show hidden files by default
let NERDTreeShowHidden=1

colorscheme gruvbox

" Terminal Colours Setup
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
filetype indent plugin on

" Mouse setup
set number
set mouse=a

" Search tweaks
set incsearch
set hlsearch
set ignorecase
set smartcase

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
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-1> :tabn 1<cr>

" Map colon to semi-colon
nmap ; :

" Map semi-colon to Files"
nnoremap <silent> ; :All<cr>
map <A-;> :Ag<CR>
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
let g:fzf_preview_window = 'right:60%'

" Map Grep to Leader + semi-colon
map <Leader><A-;> :Rg<CR>

" Rainbow
let g:rainbow_active = 1

" Map Ctrl-O to nerdtree toggle
noremap <Leader>o :NERDTreeToggle<CR>
" NERDTree Open current file
noremap <silent> <Leader>v :NERDTreeFind<CR>

map <Leader><up> :tabr<CR>
map <Leader><down> :tabl<CR>
map <Leader><down> :tabl<cr>
map <Leader><left> :tabp<CR>
map <Leader><right> :tabn<CR>

" Multiple cursor bindings
nmap <silent> <Leader>N :cn<CR>zv
nmap <silent> <Leader>P :cp<CR>zv

" Reload all bffers on L-e
map <leader>e :bufdo e!<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Markdown Syntax Support
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
 augroup END

" Grep improvements
command! -nargs=* Search :vimgrep /<q-args>/ **/*

" Use two spaces for tabs.
filetype plugin indent on
set tabstop=4
set shiftwidth=4
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
let g:ale_perl_perlcritic_showrules = 1
let g:ale_perl_perl_options       = '-cW -Ilib -I./'
let g:ale_perl_perlcritic_options = '--stern'

" Ale linting
let g:ale_linters = {
         \ 'javascript': ['standard', 'prettier', 'eslint'],
         \ 'css': ['stylelint','prettier'],
         \ 'typescript': ['standard', 'prettier', 'eslint'],
         \ 'perl': ['perl', 'perlcritic'] }

let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier'],
 \ 'typescript': ['eslint', 'prettier'],
 \ 'sass': ['prettier'],
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" Prettier for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
 endfunction

noremap <leader>ss :call StripWhitespace()<CR>
autocmd BufWritePre * :call StripWhitespace()


autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType pm setlocal shiftwidth=2 tabstop=2
autocmd FileType ts setlocal shiftwidth=2 tabstop=2

hi Normal guibg=NONE ctermbg=NONE
