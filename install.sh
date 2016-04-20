#!/usr/bin/env bash

cd

mkdir -p ~/workspace/www

# Java
sudo apt-get purge openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y build-essential python-software-properties software-properties-common ubuntu-restricted-extras
sudo apt-get install -y bash-completion curl git git-core htop pv tree vim xclip
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default

# git-up
sudo apt-get install -y ruby ruby-dev rubygems-integration
sudo gem install git-up

sudo gem install rubygems-update
sudo update_rubygems
sudo gem update --system

sudo apt-get install -y tig

sudo apt-get install python-software-properties

sudo apt-get -y purge php.*
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/php-7.0
sudo apt-get update
sudo apt-get install php5.6 php5.6-cli php5.6-curl php5.6-intl php5.6-pgsql
sudo apt-get install php7.0 php7.0-cli php7.0-curl php7.0-intl php7.0-pgsql
sudo apt-get install -y php5 php5-cli php5-curl php5-intl php5-pgsql
sudo apt-get install -y php7.0 php7.0-cli php7.0-curl php7.0-intl php7.0-pgsql

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php5/cli/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php5/apache2/php.ini

sudo curl -LsS https://symfony.com/installer -o /opt/symfony

sudo apt-get install nodejs
sudo apt-get install npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g gnomon

echo "Cleaning Up" && sudo apt-get -f install && sudo apt-get autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean

git clone https://github.com/michaeldfallen/git-radar ~/.git-radar

git clone https://github.com/baruica/dotfiles ~/dotfiles
ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
./install_client.sh

. ~/.bash_profile

exit 0
