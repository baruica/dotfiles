#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd

sudo apt-get install git
sudo apt-get install rubygems
sudo gem install git-up

sudo apt-get install nodejs
sudo apt-get install software-properties-common


ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
ln -s ./dotfiles/git/.gitconfig

sudo apt-get install apache2
sudo a2enmod vhost_alias rewrite
sudo apt-get install libapache2-mod-php5

sudo apt-get install mysql-server
sudo apt-get install php5-mysql

sudo apt-get install php5-cli php5-common php-apc php5-curl php5-intl php5

sudo add-apt-repository ppa:nijel/phpmyadmin
sudo apt-get update
sudo apt-get install phpmyadmin

# install peco, z
sudo apt-get install acroread
sudo apt-get install htop
sudo apt-get install pv
sudo apt-get install tree

source ~/.bash_profile

exit 0
