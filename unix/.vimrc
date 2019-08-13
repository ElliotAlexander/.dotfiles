
set encoding=utf8

call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree',{ 'on':  'NERDTreeToggle' }
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/denite.nvim'
Plug 'ianks/vim-tsx'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neovim/node-host'
Plug '~/.fzf'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter' 
Plug 'dkprice/vim-easygrep'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


let g:deoplete#enable_at_startup = 1
let g:node_host_prog = '/usr/lib/node_modules/neovim-node-host'

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


call plug#end()


" Terminal Colours Setup 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set t_Co=256
filetype indent plugin on

" Mouse setup
set number
set mouse=a


" Theme setup
set background=dark
colorscheme gruvbox

"Enable syntax highlighting
syntax on
" Always start NerdTree
autocmd VimEnter * NERDTree

" Don't grep node_modules
set wildignore+=**/node_modules/** 

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

command! -nargs=* Search :vimgrep /<q-args>/ **/*
let g:ackprg = 'ag --nogroup --nocolor --column'

" Use two spaces for tabs.
filetype plugin indent on
set tabstop=4
set shiftwidth=3
set expandtab

nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv


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
