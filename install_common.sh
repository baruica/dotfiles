#!/usr/bin/env bash

sudo apt remove -y apport apport-gtk

sudo add-apt-repository -yes multiverse
sudo apt install -y bash-completion bat blueman chrome-gnome-shell curl exa git htop jq keychain neofetch shellcheck tree ubuntu-restricted-extras xclip
