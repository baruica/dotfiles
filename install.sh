#!/usr/bin/env bash

DIR=$(dirname "$(readlink -m "$0")")

sudo ubuntu-drivers autoinstall

cp "${DIR}"/.bash_profile_dist ~/.bash_profile
ln -s "${DIR}"/.bashrc ~/.bashrc
source ~/.bashrc

git config --global user.name "Nelson da Costa"
git config --global user.email "ndc@octo.com"
git config --global include.path "${DIR}"/git/.gitconfig

git clone https://github.com/michaeldfallen/git-radar ~/git-radar
ln -s ~/git-radar/git-radar ~/bin/git-radar

sudo apt install composer

composer global require bamarni/symfony-console-autocomplete
composer global require friendsofphp/php-cs-fixer
