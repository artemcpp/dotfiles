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
Plugin 'scrooloose/nerdcommenter'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'   " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plugin 'tomtom/tlib_vim'   " dependencies #2
"=====================================================

set ls=2             " Always show statusbar

let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" NerdTree
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

map <F2> :TaskList<CR>

" Lusty Explorer
" map <C-p> :LustyBufferExplorer<CR>
"
""---------------=== Languages support ===-------------

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

"" Rainbow Parantheses settings

let g:rainbow_active = 1
let g:rainbow_operators = 1

au VimEnter * RainbowToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

map <C-T> <C-Space>

syntax on

set nofoldenable
set ignorecase
set hlsearch
set autoindent

set fileencoding=utf-8
set encoding=utf-8

set backspace=indent,eol,start

"" Use spaces over tabs
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
set relativenumber


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

"" Custom Mappings

cmap Vrc :e ~/.vimrc

map <leader>t :tabedit<CR>
map <leader>q :tabclose<CR>
map <leader>] :tabnext<CR>
map <leader>[ :tabprevious<CR>

nmap ;p mayyp`a

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

if exists('$TMUX')
   function! TmuxOrSplitSwitch(wincmd, tmuxdir)
       let previous_winnr = winnr()
       silent! execute "wincmd " . a:wincmd
       if previous_winnr == winnr()
           call system("tmux select-pane -" . a:tmuxdir)
           redraw!
       endif
   endfunction

   let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
   let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
   let &t_te = "\<Esc>]2;".  previous_title . "\<Esc>\\" .  &t_te

   nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr> 
   nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
   nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
   nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
   map <C-h> <C-w>h
   map <C-j> <C-w>j
   map <C-k> <C-w>k
   map <C-l> <C-w>l
endif

" Enable true silence

command! -nargs=1 Silent
           \ | execute ':silent !'.<q-args>
           \ | execute ':redraw!'

