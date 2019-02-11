#!/usr/bin/env bash

readonly DIR=$(dirname "$(readlink -m "$0")")

rm -f ~/.bash_profile
cp "${DIR}"/.bash_profile_dist ~/.bash_profile

rm -f ~/.bashrc
ln -s "${DIR}"/.bashrc ~/.bashrc
. ~/.bashrc

git config --global user.name "Nelson da Costa"
git config --global include.path "${DIR}"/git/.gitconfig

[[ ! -d ~/bin ]] && mkdir ~/bin

[[ ! -d ~/git-radar ]] && git clone https://github.com/michaeldfallen/git-radar ~/git-radar
[[ ! -e ~/bin/git-radar ]] && ln -s ~/git-radar/git-radar ~/bin/git-radar

[[ ! -d ~/z ]] && git clone https://github.com/rupa/z ~/z
[[ ! -e ~/z/z.sh ]] && chmod u+x ~/z/z.sh
