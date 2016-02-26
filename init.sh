#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf "${DIR}/dotfiles/git/.gitconfig" ~/.gitconfig

ln -sf "${DIR}/dotfiles/.bash_profile" ~/.bash_profile
