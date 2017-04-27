#!/usr/bin/env bash

check_is_sudo() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "Please run as root."
        exit
    fi
}

sudo apt install -y build-essential python-software-properties software-properties-common ubuntu-restricted-extras

sudo apt install -y bash-completion chromium-browser curl git git-core htop keychain neofetch pv shellcheck tree vim xclip

# Java
sudo apt-get purge openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

sudo apt-get install -y maven

sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update
sudo apt-get install gradle

# LAMP
sudo apt-get -y purge php.*
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.1 php7.1-bcmath php7.1-cli php7.1-curl php7.1-intl php7.1-mbstring php7.1-mysql php7.1-pgsql php7.1-sqlite php7.1-xdebug php7.1-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.1/cli/php.ini

sudo apt-get install -y mysql-server

apt-get autoremove
apt-get autoclean
apt-get clean
