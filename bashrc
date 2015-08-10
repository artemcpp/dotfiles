# Using Python 3 by default
env PYTHONPATH=/Library/Frameworks/Python.framework/Version/3.4/lib/python3.4/site-packages

# Load256-colr pallet (used for vim Gruvbox colorscheme)
source ~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh

# Aliases
alias reload="source ~/.bashrc &> /dev/null"

alias bashrc="vim ~/.bashrc"
alias brc="bashrc && reload"
alias vimrc="vim ~/.vimrc"
alias vrc="vimrc"
alias tmuxconf="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"

alias pg="cd ~/playground"
alias pgp="cd ~/playground/python"
alias pgc="cd ~/playground/clojure"

alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -lha"
alias psa="ps ax"

alias tmx="tmux -2 attach || tmux -2 new"

alias mare="more"

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

