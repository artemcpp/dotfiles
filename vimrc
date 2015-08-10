set nocompatible

filetype off
set hidden
let mapleader=","

"=====================================================
"" Vundle settings
"=====================================================
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Bundle 'L9'
"Bundle 'FuzzyFinder'

Plugin 'gmarik/Vundle.vim'    " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'         " Project and file navigation
Plugin 'majutsushi/tagbar'           " Class/module browser
Plugin 'LustyExplorer'
Plugin 'Ack.vim'
Plugin 'EasyMotion'
"
""------------------=== Other ===----------------------
Plugin 'bling/vim-airline'          " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'    " Pending tasks list
Plugin 'rosenfeld/conque-term'        " Consoles as buffers
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
"Plugin 'AutoClose'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Powerline'

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'   " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plugin 'tomtom/tlib_vim'   " dependencies #2
Plugin 'honza/settings'
"=====================================================

set ls=2             " всегда показываем статусбар

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR> 	   " CTRL+Q - закрыть текущий буфферim-snippets'    " snippets repo

" Lusty Explorer
map <C-p> :LustyBufferExplorer<CR>
"
""---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'          " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'    " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'   " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim


call vundle#end()                " required
filetype on
filetype plugin on
filetype plugin indent on

" Airline settings
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


syntax on

set nofoldenable
set ignorecase
set hlsearch
set autoindent

set fileencoding=utf-8
set encoding=utf-8

set backspace=indent,eol,start

set number     " Display the number of each row

" Use spaces over tabs
set expandtab  
set tabstop=4
set shiftwidth=4

set smartcase
set incsearch
set gdefault
set showmatch

set noswapfile
set visualbell

set nofoldenable


set t_Co=256
set bg=dark
let g:gruvbox_termcolors=256
let g:gruvbox_italic=0      " without it comment highliting is not working.
colorscheme gruvbox

set rnu " Relutive numbering
au FocusLost * :set number
au FocusGained * :set rnu
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Custom Maps
cmap vrc e ~/.vimrc

map <C-t> :tabedit<CR>
map <C-q> :tabclose<CR>
map <C-l> :tabnext<CR>
map <C-h> :tabprevious<CR>

no <C-k> ddkP
no <C-j> ddp

nmap lp mayyp`a

ino <up> <Nop>
ino <down> <Nop>

map <C-c> :noh<CR>

" abs/relative lines toggle
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>[ []<ESC>i

nmap go mao<ESC>k`a
nmap gO maO<ESC>j`a

"iabbr email artemcpp@gmail.com

