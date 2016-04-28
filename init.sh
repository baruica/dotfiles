#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

git config --global user.name "Nelson da Costa"
git config --global include.path dotfiles/git/.gitconfig

ln -sf "${DIR}/dotfiles/.bash_profile" ~/.bash_profile
