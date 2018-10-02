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
sudo apt install -y php7.2 php7.2-bcmath php7.2-cli php7.2-curl php7.2-intl php7.2-mbstring php7.2-mysql php7.2-pgsql php7.2-sqlite php7.2-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.2/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.2/cli/php.ini

sudo apt clean
sudo apt autoremove

# Ansible
sudo apt install -y python-pip
sudo pip install ansible==2.4
