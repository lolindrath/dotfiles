#!/bin/bash

DOTFILES=${HOME}/dotfiles

mv ${HOME}/.bashrc ${HOME}/.bashrc.bak 2>/dev/null # Move default bashrc out of the way

ln -s ${DOTFILES}/bash_profile ${HOME}/.bash_profile
ln -s ${DOTFILES}/bashrc ${HOME}/.bashrc
ln -s ${DOTFILES}/tmux.conf ${HOME}/.tmux.conf
ln -s ${DOTFILES}/gitconfig ${HOME}/.gitconfig
ln -s ${DOTFILES}/liquidprompt ${HOME}/.liquidprompt
ln -s ${DOTFILES}/liquidpromptrc ${HOME}/.liquidpromptrc
ln -s ${DOTFILES}/vimrc ${HOME}/.vimrc
ln -s ${DOTFILES}/vim ${HOME}/.vim
ln -s ${DOTFILES}/bin ${HOME}/bin
