#!/usr/bin/env bash

sudo apt remove -y bluez bluetooth

sudo add-apt-repository -yes multiverse
sudo apt install -y bash-completion chrome-gnome-shell curl git htop jq keychain neofetch shellcheck tree ubuntu-restricted-extras xclip

# Java
sudo apt purge -y openjdk*

wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install adoptopenjdk-14-openj9

sudo apt install -y maven

sudo add-apt-repository -yes ppa:cwchien/gradle
sudo apt update
sudo apt install -y gradle

# PHP
sudo apt -y purge php.*

sudo add-apt-repository -yes ppa:ondrej/php
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
