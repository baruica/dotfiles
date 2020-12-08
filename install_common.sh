#!/usr/bin/env bash

sudo apt remove -y apport apport-gtk

sudo add-apt-repository -yes multiverse
sudo apt install -y bash-completion blueman chrome-gnome-shell curl git htop jq keychain neofetch shellcheck tree ubuntu-restricted-extras xclip

# Java
sudo apt purge -y openjdk*

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 15.0.9.hs-adpt

sudo apt install -y maven

sudo add-apt-repository -yes ppa:cwchien/gradle
sudo apt update
sudo apt install -y gradle

# PHP
sudo apt -y purge php.*

sudo add-apt-repository -yes ppa:ondrej/php
sudo apt-get update

sudo apt install -y php8.0-{bcmath,cli,curl,intl,mbstring,pgsql,xml}

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/8.0/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/8.0/cli/php.ini

sudo apt clean
sudo apt autoremove
