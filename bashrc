# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set editor to vim
export EDITOR=vim

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries
export HISTCONTROL=ignoreboth
# ignore some common commands to keep the history clean
export HISTIGNORE="&:ls:[bf]g:exit"
# change the history size
export HISTSIZE=10000
# Append to history, don't wipe it out
shopt -s histappend

# Enable bash auto completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    if [ $OSTYPE == "darwin10.0" ]; then
        alias ls='ls -G'
    elif [ $OSTYPE == "darwin9.0" ]; then
        alias ls='ls -G'
    elif [ $OSTYPE == 'FreeBSD' ]; then
        alias ls='ls -G'
    elif [ $OSTYPE == 'linux-gnu' ]; then
        eval "`dircolors -b`"
        alias ls='ls --color=auto'
    fi
fi

# Add the homedir bin to path
export PATH=${HOME}/bin:${PATH}
# Add /usr/local to $PATH
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Use Liquid Prompt (https://github.com/nojhan/liquidprompt)
source ${HOME}/dotfiles/liquidprompt

# Allow local overrides for bash (if the file exists)
if [ -f ~/.bashrc.local ]; then
    source ${HOME}/.bashrc.local
fi
