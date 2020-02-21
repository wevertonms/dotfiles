call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion', {'branch': 'master'}
Plug 'rakr/vim-one', {'branch': 'master'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme one
set background=dark
set number
let g:airline_theme='minimalist'
