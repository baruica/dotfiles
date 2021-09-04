#!/usr/bin/env bash

readonly DIR=$(dirname "$(readlink -m "$0")")

rm -f ~/.bash_profile
cp "${DIR}"/.bash_profile_dist ~/.bash_profile

rm -f ~/.gitconfig
cp "${DIR}"/git/baruica.gitconfig ~/baruica/
cp "${DIR}"/git/dist.gitconfig ~/.gitconfig

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "eval \"$(starship init bash)\"" >> ~/.bashrc
cp "${DIR}"/starship.toml ~/.config/
