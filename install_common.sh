#!/usr/bin/env bash

check_is_sudo() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "Please run as root."
        exit
    fi
}

sudo apt-get install -y build-essential software-properties-common ubuntu-restricted-extras

sudo apt-get install chromium-browser

sudo apt-add-repository ppa:ansible/ansible
sudo apt-get install ansible

# VirtualBox
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian yakkety contrib" >> /etc/apt/sources.list.d/virtualbox.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt update && sudo apt install virtualbox-5.1

sudo apt-get install vagrant

sudo apt-get install keychain

sudo apt-get install shellcheck

# Java
sudo apt-get purge openjdk*
sudo apt-get update
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

sudo apt-get install -y maven

sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update
sudo apt-get install gradle

sudo apt-get install -y bash-completion curl git git-core htop pv tig tree vim xclip

# LAMP
sudo apt-get -y purge php.*
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.1 php7.1-bcmath php7.1-cli php7.1-curl php7.1-intl php7.1-mbstring php7.1-pgsql php7.1-sqlite php7.1-xdebug php7.1-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.1/cli/php.ini

sudo apt-get install -y apache2
sudo apt-get install -y libapache2-mod-php5

# Set your server name (Avoid error message on reload/restart of Apache)
echo 'ServerName localhost' >> /etc/apache2/httpd.conf

sudo a2enmod vhost_alias rewrite
sudo service apache2 restart

sudo apt-get install -y mysql-server

apt-get autoremove
apt-get autoclean
apt-get clean
