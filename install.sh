#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd

ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
ln -s ./dotfiles/git/.gitconfig

sudo apt-get autoremove apport unity-lens-shopping

sudo add-apt-repository "deb http://archive.canonical.com/ precise partner"
sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:nijel/phpmyadmin
sudo add-apt-repository ppa:russell-s-stewart/ppa
sudo apt-get update

sudo apt-get install ubuntu-restricted-extras
sudo gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# install peco, z
sudo apt-get install acroread bash-completion bleachbit curl git htop pv python-software-properties rubygems ruby-dev software-properties-common sshrc tree
sudo gem install git-up

sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default


sudo apt-get install apache2
sudo a2enmod vhost_alias rewrite

sudo apt-get install mysql-server php5-mysql

sudo apt-get install php5 php5-cli libapache2-mod-php5 php5-curl
sudo apt-get install php5-intl
# mcrypt
sudo apt-get install php5-mcrypt
sudo php5enmod mcrypt
sudo service apache2 restart

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer


sudo apt-get install phpmyadmin apache2-utils
sudo vim /etc/apache2/apache2.conf
# add Include /etc/phpmyadmin/apache.conf
sudo service apache2 restart


sudo add-apt-repository -r "deb http://archive.canonical.com/ precise partner"
sudo apt-get update

echo "Cleaning Up" && sudo apt-get -f install && sudo apt-get autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean

source ~/.bash_profile

exit 0
