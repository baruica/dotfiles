#!/bin/sh -

cd

ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
ln -s ./dotfiles/.gitconfig

source ~/.bash_profile

exit 0
