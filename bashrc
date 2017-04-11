# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ${HOME}/dotfiles/sensible.bash

# Set editor to vim
export EDITOR=vim

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

# Use Liquid Prompt (https://github.com/nojhan/liquidprompt)
source ${HOME}/dotfiles/liquidprompt

# Allow local overrides for bash (if the file exists)
if [ -f ~/.bashrc.local ]; then
    source ${HOME}/.bashrc.local
fi

source ${HOME}/dotfiles/bash.aliases

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


alias myip='curl ipinfo.io/ip'
