call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branche': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme one
set background=dark
set number
set relativenumber
let g:airline_theme='minimalist'
let g:airline_theme='one'

set runtimepath^=~/.vim/bundle/ctrlp.vim
