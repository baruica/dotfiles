#!/bin/sh -

cd

ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
ln -s ./dotfiles/.gitconfig

for cmd in htop pv tree; do
    apt-get install "$cmd"
done

source ~/.bash_profile

exit 0
