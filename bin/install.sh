#!/bin/sh -

cd

apt-get install git
apt-get install rubygems
gem install git-up

ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
ln -s ./dotfiles/.gitconfig

apt-get install apache2
a2enmod vhost_alias rewrite
apt-get install libapache2-mod-php5

apt-get install mysql-server
apt-get install php5-mysql

apt-get install php5-cli php5-common php-apc php5-curl php5-intl php5

for cmd in "acroread htop pv screen tree"
do
    apt-get install "$cmd"
done

source ~/.bash_profile

exit 0
