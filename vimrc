let mapleader=" "
syntax on
set number
" set laststatus=2
set relativenumber
" set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" 256位颜色支持
set t_Co=256
set background=dark

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l
noremap n nzz
noremap N Nzz
noremap <LEADER><CR> :nohlsearch<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

colorscheme PaperColor
let g:airline_theme='papercolor'
let g:lightline = { 'colorscheme': 'PaperColor' }
