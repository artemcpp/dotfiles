export PATH=/usr/local/lib:/usr/local/include:/opt/local/bin:$PATH
# Using Python 3 by default
export PYTHONPATH=/Library/Frameworks/Python.framework/Version/3.4/lib/python3.4/site-packages

# Load256-colr pallet (used for vim Gruvbox colorscheme)
source ~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh

export PS1="\033[31m\u@\h:\w$ \033[0m"
export EDITOR=/usr/bin/vim

# Aliases
alias reload="source ~/.bashrc &> /dev/null"

alias bashrc="vim ~/.bashrc"
alias brc="bashrc && reload"
alias vimrc="vim ~/.vimrc"
alias vrc="vimrc"
alias tmuxconf="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"
alias als="vim ~/.osx_shortcuts"

alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -lha"
alias psa="ps ax"

alias tmx="tmux -2 attach || tmux -2 new"

alias mare="more"

#OS X specific aliases
source ~/.osx_shortcuts

# Git shortcuts
source ~/.git_shortcuts

# Functions

mcd () { mkdir $1 && cd $1; }

# Eddit home directory config files
conf () {
    vim ~/.$1;
    reload;
}

# Fast addit shortcuts files
editsc () {
    vim ~/.$1_shortcuts; 
    reload;
}

# True autoreload for vim
vim-watch () {
    ls $1 | entr tmux send-keys -t $2 ":checktime" C-m
}

