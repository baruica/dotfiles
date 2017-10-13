#!/usr/bin/env bash

check_is_sudo() {
    if [[ $EUID -ne 0 ]]; then
        echo "Please run as root."
        exit
    fi
}

sudo apt install -y build-essential python-software-properties software-properties-common ubuntu-restricted-extras

sudo apt-add-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y bash-completion chromium-browser curl fonts-hack-ttf git git-core htop keychain neofetch pv shellcheck tree xclip
sudo fc-cache -fv

# Java
sudo apt purge openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install -y oracle-java8-installer

sudo apt install -y maven

sudo add-apt-repository ppa:cwchien/gradle
sudo apt update
sudo apt install gradle

# LAMP
sudo apt -y purge php.*
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php7.1 php7.1-bcmath php7.1-cli php7.1-curl php7.1-intl php7.1-mbstring php7.1-mysql php7.1-pgsql php7.1-sqlite php7.1-xdebug php7.1-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.1/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.1/cli/php.ini

sudo apt install -y mysql-server

sudo apt autoremove
sudo apt autoclean
sudo apt clean
