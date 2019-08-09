
set encoding=utf8

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Bundle 'edkolev/tmuxline.vim'



call vundle#end()            " required
filetype plugin indent on    " required

colorscheme gruvbox


" Set 256 bit colours
set t_Co=256
set bg=dark
filetype indent plugin on
set number
set mouse=a

syntax on


autocmd VimEnter * NERDTree
