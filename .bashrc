# Using Python 3 by default
env PYTHONPATH=/Library/Frameworks/Python.framework/Version/3.4/lib/python3.4/site-packages

# Aliases

alias reload="source ~/.bashrc"

alias bashrc="vim ~/.bashrc"
alias brc="bashrc && reload && clear"
alias vimrc="vim ~/.vimrc"
alias vrc="vimrc"

alias pg="cd ~/playground"
alias pgp="cd ~/playground/python"
alias pgc="cd ~/playground/clojure"

alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -lha"
alias psa="ps ax"

# Git shortcuts

source ~/.git_shortcuts

# Functions

mcd () { mkdir $1 && cd $1; }

# Fash addit shortcuts files
editsc () {
    vim ~/.$1_shortcuts; 
    reload;
    clear;
}

