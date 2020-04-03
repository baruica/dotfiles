#!/usr/bin/env bash

sudo apt remove -y bluez bluetooth

sudo add-apt-repository multiverse
sudo apt install -y bash-completion chrome-gnome-shell curl git htop jq keychain neofetch shellcheck tree ubuntu-restricted-extras xclip

# fonts
sudo apt install -y fonts-firacode ttf-mscorefonts-installer ttf-ancient-fonts
sudo fc-cache -fv

# Java
sudo apt purge -y openjdk*
sudo apt install -y default-jdk

sudo apt install -y maven

# PHP
sudo apt -y purge php.*

sudo add-apt-repository ppa:ondrej/php
sudo apt update

readonly PHP_VERSION="7.4"
sudo apt install -y php$PHP_VERSION php$PHP_VERSION-bcmath php$PHP_VERSION-cli php$PHP_VERSION-curl php$PHP_VERSION-intl php$PHP_VERSION-mbstring php$PHP_VERSION-pgsql php$PHP_VERSION-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/$PHP_VERSION/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/$PHP_VERSION/cli/php.ini

sudo apt clean
sudo apt autoremove

# Ansible
sudo apt install -y python-pip
sudo pip install ansible==2.4
