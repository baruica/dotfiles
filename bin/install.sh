#!/bin/sh -

cd

ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
ln -s ./dotfiles/.gitconfig

sudo apt-get install rubygems
sudo gem install git-up

for cmd in acroread htop pv screen tree
do
    apt-get install "$cmd"
done

source ~/.bash_profile

exit 0