" Common settings
set nocompatible " Make it doesn't worry about retro-compatibility with Vim
let mapleader=" " " Space bar
filetype plugin indent on
syntax enable

set number relativenumber
set mouse=a " Add mouse support
set inccommand=split " Show a split for incremental search/replace
set confirm " Ask for confirmation before leave
set title " Set the window title the vim name
set cursorline " Highlights the current line
" Search settings
set incsearch
set ignorecase smartcase
"set nohlsearch
" Tab/indent configuration
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set backspace=indent,eol,start
" Split position configs
set splitbelow
set splitright

" set spell
set spelllang=en_us,pt_br
" Enable folding
" set foldmethod=indent
" set foldlevel=99
autocmd FileType python set colorcolumn=89 " Ruler


" Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


call plug#begin('~/.config/nvim/plugged')
Plug 'romainl/vim-cool' " Awesome search highlighting
Plug 'gko/vim-coloresque'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branche': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1 " Powerline style
    let g:airline_theme='codedark'
Plug 'vim-airline/vim-airline-themes'
    "let g:airline_theme='powerlinish'
    let g:airline#extensions#tabline#enabled = 1 " Show tabs for buffers
" Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled = ['latex']
Plug 'ctrlpvim/ctrlp.vim'
    " map <c-t> :CtrlPTag<cr>
    let g:ctrlp_working_path_mode = 'ra' " List files in the current directoru
    let g:ctrlp_user_command = ['.git', 'cd %s && rg --files-with-matches ".*"', 'find %s -type f']  " Ignore files in .gitignore
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|pyc|aux|ipynb|ilg|log)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
Plug 'lervag/vimtex'
    let g:vimtex_compiler_progname = 'nvr'
Plug 'jiangmiao/auto-pairs'
" Plug 'mhinz/vim-startify'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
    map <c-s-e> :NERDTreeToggle<cr>
    let NERDTreeWinPos = "right"
Plug 'tpope/vim-fugitive'
Plug 'atsepkov/vim-pydocstring'
    let g:pydocstring_formatter = 'google'
    let g:pydocstring_doq_path='/home/weverton/.local/bin/doq'
" Julia ============================================================
" Plug 'JuliaEditorSupport/julia-vim'
" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'

call plug#end()


let g:rehash256 = 1
set background=dark
colorscheme molokai
" Make background transparent
hi Normal guibg=NONE ctermbg=NONE
let python_highlight_all=1

nnoremap <leader>, :tabnew ~/.config/nvim/init.vim<cr>:source ~/.config/nvim/init.vim<cr>
map <leader>r :%s///g<Left><Left><Left>
map <leader>a ggVG
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprevious<cr>
nnoremap <leader>/ :Commentary<cr>
map j gj
map k gk
nnoremap <c-q> :bdelete<cr>
nnoremap <c-s> :w<cr>

" Split navigations
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Remove trailing whitespaces on save
" autocmd BufWritePre *.py !black %
" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * :Format
autocmd BufWritePre *.py :CocCommand python.sortImport<cr>

set switchbuf=usetab " Open new files in tabs
" set showtabline=2 " tabs allways visible

set clipboard=unnamedplus

" ============================================================
" COC SETTINGS

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" =============================================================================
" COC config
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <F8> <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<clsr
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




" Julia LS config =================================================
" julia
" let g:default_julia_version = '1.0'

" language server
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
" \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
" \       using LanguageServer;
" \       using Pkg;
" \       import StaticLint;
" \       import SymbolServer;
" \       env_path = dirname(Pkg.Types.Context().env.project_file);
" \       debug = false;
" \
" \       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "");
" \       server.runlinter = true;
" \       run(server);
" \   ']
" \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
