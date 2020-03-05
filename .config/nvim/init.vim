call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branche': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
call plug#end()

colorscheme one
set background=dark
set number
set relativenumber
set mouse=a
set inccommand=split
let mapleader="\<space>"
let g:airline_theme='minimalist'
let g:airline_theme='one'
let g:polyglot_disabled = ['latex']

nnoremap <leader>ec :vsplit ~/.config/nvim/init.vim<cr>:source ~/.config/nvim/init.vim<cr>
nnoremap <c-p> :Files<cr>
