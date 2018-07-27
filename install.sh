#!/usr/bin/env bash

readonly DIR=$(dirname "$(readlink -m "$0")")

rm -f ~/.bash_profile
cp "${DIR}"/.bash_profile_dist ~/.bash_profile

rm -f ~/.bashrc
ln -s "${DIR}"/.bashrc ~/.bashrc
# shellcheck source=/dev/null
source ~/.bashrc

git config --global user.name "Nelson da Costa"
git config --global user.email "ndc@octo.com"
git config --global include.path "${DIR}"/git/.gitconfig

[[ ! -d ${HOME}/bin ]] && mkdir ~/bin
[[ ! -d ${HOME}/git-radar ]] && git clone https://github.com/michaeldfallen/git-radar ~/git-radar
[[ ! -e ${HOME}/bin/git-radar ]] && ln -s ~/git-radar/git-radar ~/bin/git-radar
