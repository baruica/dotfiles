#!/bin/sh -

cd

ln -s ./dotfiles/.bash_aliases
ln -s ./dotfiles/.bash_ps1
ln -s ./dotfiles/.gitconfig
ln -s ./dotfiles/.gitignore_global

if [ -f ~/dotfiles/.bashrc ]; then
    cat ~/dotfiles/.bashrc_install >> ~/.bashrc
fi

source ~/.bashrc

exit 0
