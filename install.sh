#!/usr/bin/env bash

DIR=$(dirname "$(readlink -m "$0")")

sudo ubuntu-drivers autoinstall

[[ -e ${HOME}/.bash_profile ]] && rm ~/.bash_profile
cp "${DIR}"/.bash_profile_dist ~/.bash_profile

[[ -e ${HOME}/.bashrc ]] && rm ~/.bashrc
ln -s "${DIR}"/.bashrc ~/.bashrc
source ~/.bashrc

git config --global user.name "Nelson da Costa"
git config --global user.email "ndc@octo.com"
git config --global include.path "${DIR}"/git/.gitconfig

[[ ! -d ${HOME}/git-radar ]] && git clone https://github.com/michaeldfallen/git-radar ~/git-radar
[[ ! -e ${HOME}/bin/git-radar ]] && ln -s ~/git-radar/git-radar ~/bin/git-radar

ln -s ~/workspace/baruica/dotfiles/update.sh ~/bin/update
