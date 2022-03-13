let mapleader=" "

set nocompatible
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set encoding=utf-8

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" vim下复制粘贴操作支持系统剪切板
" 通过+寄存器实现
set clipboard=unnamed

" ==== 系统剪切板复制粘贴 ====
" <M-c> 即为 Alt+c
" v 模式下复制内容到系统剪切板
" vmap <M-c> "+yy
" n 模式下复制一行到系统剪切板
" nmap <M-c> "+yy
" n 模式下粘贴系统剪切板的内容
" nmap <M-v> "+p

" WSL限定
" 可视模式下将选择的内容通过clip.exe程序复制到系统剪切板
vmap <LEADER>y :!clip.exe<cr>u''

" 显示空白字符
" set list
set scrolloff=5
set backspace=indent,eol,start

" 设置vim页面刷新到缓冲区的时间
" 有些实时监测页面状态的插件希望这个时间越短越好
" 时间越短实时效果越好
" 单位ms
set updatetime=100

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.md write

" 插入模式和normal模式光标不一样
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set autochdir

" ===
" === Restore Cursor Position
" === 上次打开文件光标所在地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax enable
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
set showmatch

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

" 打开/关闭NerdTree文件树预览
noremap <F9> :NERDTreeToggle<CR>

" 打开/关闭markdown预览
noremap <F7> :MarkdownPreviewToggle<CR>

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
Plug 'airblade/vim-gitgutter'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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
