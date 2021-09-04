#!/usr/bin/env bash

readonly DIR=$(dirname "$(readlink -m "$0")")

rm -f ~/.bash_profile
cp "${DIR}"/.bash_profile_dist ~/.bash_profile

git config --global user.name "Nelson da Costa"
git config --global include.path "${DIR}"/git/.gitconfig

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "eval \"$(starship init bash)\"" >> ~/.bashrc
cp "${DIR}"/starship.toml ~/.config/
