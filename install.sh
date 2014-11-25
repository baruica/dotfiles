#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd

sudo apt-get remove apport
sudo apt-get autoremove unity-lens-shopping

# install peco, z
sudo apt-get install acroread curl git htop pv python-software-properties rubygems software-properties-common tree
sudo gem install git-up

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default


ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
ln -s ./dotfiles/git/.gitconfig

sudo apt-get install apache2
sudo a2enmod vhost_alias rewrite

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
curl http://icanhazip.com

sudo apt-get install mysql-server php5-mysql

sudo apt-get install php5 php5-cli libapache2-mod-php5 php5-curl php5-mcrypt

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer


sudo add-apt-repository ppa:nijel/phpmyadmin
sudo apt-get update
sudo apt-get install phpmyadmin apache2-utils
sudo nano /etc/apache2/apache2.conf
# add Include /etc/phpmyadmin/apache.conf
sudo service apache2 restart


sudo add-apt-repository ppa:rquillo/ansible
sudo apt-get update
sudo apt-get install ansible

# In order to make Vagrant work with NFS synced folders on Ubuntu, we need two extra packages:
sudo apt-get install nfs-common nfs-kernel-server


sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo apt-get update
sudo apt-get install y-ppa-manager

echo "Cleaning Up" && sudo apt-get -f install && sudo apt-get autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean


source ~/.bash_profile

exit 0
