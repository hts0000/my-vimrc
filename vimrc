let mapleader=" "

set nocompatible
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set encoding=utf-8

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set list
set scrolloff=5
set backspace=indent,eol,start

" 插入模式和normal模式光标不一样
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set autochdir

" ===
" === Restore Cursor Position
" === 上次打开文件光标所在地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax on
set number
set laststatus=2
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

" 打开vimrc配置文件
noremap <LEADER>frc :tabe $MYVIMRC<CR>

" 设置向右分屏，并且光标移动过去
noremap sl :set splitright<CR>:vsp<CR>
" 设置向下分屏，并且光标移动过去
noremap sj :set splitbelow<CR>:sp<CR>
" 跳转下一个窗口
noremap <LEADER>wn <C-w>w
" 仅保留当前窗口，其他关闭
noremap <LEADER>wo :only<CR>
" 关闭当前窗口
noremap <LEADER>wc :close<CR>
" 缩小当前窗口
noremap <LEADER>w= :vertical resize+5<CR>
" 扩大当前窗口 
noremap <LEADER>w- :vertical resize-5<CR>

" 新开标签页
noremap <LEADER>nt :tabe<CR>
" 跳转下一标签页
noremap <LEADER>tn :tabn<CR>
" 跳转上一标签页
noremap <LEADER>tb :tabp<CR>

noremap <LEADER>ft :NERDTreeToggle<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes' " 显示分支需要fugitive插件
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' " need nerd fonts https://github.com/ryanoasis/nerd-fonts#font-installation
Plug 'tpope/vim-fugitive'
call plug#end()

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

" air-line主题设置
colorscheme PaperColor
let g:airline_theme='papercolor'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty= '⚡'

" vim主题设置
let g:lightline = { 'colorscheme': 'PaperColor' }
