#!/usr/bin/env bash

check_is_sudo() {
    if [[ $EUID -ne 0 ]]; then
        echo "Please run as root."
        exit
    fi
}

sudo apt-get remove -y bluez bluetooth

sudo apt install -y bash-completion curl fonts-firacode git htop jq keychain neofetch shellcheck ttf-mscorefonts-installer tree xclip
sudo fc-cache -fv

# Java
sudo apt purge -y openjdk*
sudo apt install -y default-jdk

sudo apt install -y maven

# PHP
sudo apt -y purge php.*

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt install -y php7.3 php7.3-bcmath php7.3-cli php7.3-curl php7.3-intl php7.3-mbstring php7.3-mysql php7.3-pgsql php7.3-sqlite php7.3-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.3/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.3/cli/php.ini

sudo apt clean
sudo apt autoremove

# Ansible
sudo apt install -y python-pip
sudo pip install ansible==2.4
