#!/usr/bin/env bash

readonly DIR=$(dirname "$(readlink -m "$0")")

cp -rf "${DIR}"/.bash_profile_dist ~/.bash_profile

cp -rf "${DIR}"/git/baruica.gitconfig ~/baruica/
cp -rf "${DIR}"/git/dist.gitconfig ~/.gitconfig

sudo apt remove -y apport apport-gtk

sudo add-apt-repository -y multiverse
sudo apt update

sudo apt install -y curl git jq neofetch ubuntu-restricted-extras cargo libssl-dev pkg-config

cargo install cargo-update
cargo install topgrade

cargo install startship --locked
echo "eval \"$(starship init bash)\"" >> ~/.bashrc
cp -rf "${DIR}"/starship.toml ~/.config/
