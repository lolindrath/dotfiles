if [ -f ~/.bashrc ]; then
  . ~/.bashrc # execute the ~/.bashrc file
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
