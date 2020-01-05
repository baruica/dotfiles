#!/usr/bin/env bash

check_is_sudo() {
    if [[ $EUID -ne 0 ]]; then
        echo "Please run as root."
        exit
    fi
}

sudo apt remove -y bluez bluetooth

sudo apt install -y bash-completion curl fonts-firacode git htop jq keychain neofetch shellcheck ttf-mscorefonts-installer ttf-ancient-fonts tree xclip
sudo fc-cache -fv

# Java
sudo apt purge -y openjdk*
sudo apt install -y default-jdk

sudo apt install -y maven

# PHP
sudo apt -y purge php.*

sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt install -y php7.4 php7.4-bcmath php7.4-cli php7.4-curl php7.4-intl php7.4-mbstring php7.4-mysql php7.4-pgsql php7.4-sqlite php7.4-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.4/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.4/cli/php.ini

sudo apt clean
sudo apt autoremove

# Ansible
sudo apt install -y python-pip
sudo pip install ansible==2.4
