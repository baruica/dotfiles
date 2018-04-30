#!/usr/bin/env bash

check_is_sudo() {
    if [[ $EUID -ne 0 ]]; then
        echo "Please run as root."
        exit
    fi
}

sudo apt install -y build-essential software-properties-common ubuntu-restricted-extras

sudo apt-add-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y bash-completion curl fonts-firacode fonts-hack-ttf git git-core htop jq keychain neofetch pv p7zip-full shellcheck tree xclip
sudo fc-cache -fv

# Ansible
sudo apt install -y python-pip
sudo pip install ansible==2.4

# Java
sudo apt purge openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install -y oracle-java8-installer

sudo apt install -y maven

# PHP
sudo apt -y purge php.*
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php7.1 php7.1-bcmath php7.1-cli php7.1-curl php7.1-intl php7.1-mbstring php7.1-mysql php7.1-pgsql php7.1-sqlite php7.1-xdebug php7.1-xml
sudo apt install -y php7.2 php7.2-bcmath php7.2-cli php7.2-curl php7.2-intl php7.2-mbstring php7.2-mysql php7.2-pgsql php7.2-sqlite php7.2-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.2/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.2/cli/php.ini

sudo apt install -y mysql-server

composer global require bamarni/symfony-console-autocomplete
composer global require friendsofphp/php-cs-fixer

# Node
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g tldr

sudo apt autoremove
sudo apt autoclean
sudo apt clean
