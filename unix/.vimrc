"""""""""""""""""""""""""""""""""""""
" Allan MacGregor Vimrc configuration 
"""""""""""""""""""""""""""""""""""""
set encoding=utf8

"""" START Vundle Configuration 

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Bundle 'edkolev/tmuxline.vim'



call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 


colorscheme gruvbox


" Set 256 bit colours
set t_Co=256
set bg=dark
filetype indent plugin on
set number
set mouse=a

syntax on


autocmd VimEnter * NERDTree
