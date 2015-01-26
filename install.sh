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

sudo apt-get install -y build-essential
sudo apt-get install -y python-software-properties
sudo apt-get install -y ubuntu-restricted-extras
sudo gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# install peco, z
sudo apt-get install -y acroread bash-completion bleachbit curl git htop pv rubygems ruby-dev software-properties-common sshrc tig tree
sudo gem install git-up

sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

# Install the LAMP components
sudo apt-get install -y php5
sudo apt-get install -y apache2
sudo apt-get install -y libapache2-mod-php5
sudo apt-get install -y mysql-server
sudo apt-get install -y php5-mysql
sudo apt-get install -y php5-curl
sudo apt-get install -y php5-intl
sudo apt-get install -y php5-mcrypt
sudo php5enmod mcrypt

# Set your server name (Avoid error message on reload/restart of Apache)
echo 'ServerName localhost' >> /etc/apache2/httpd.conf

sudo a2enmod vhost_alias rewrite
sudo service apache2 restart

sudo apt-get install -y git-core

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

composer global require squizlabs/php_codesniffer
composer global require symfony/var-dumper
# Add auto_prepend_file = ${HOME}/.composer/vendor/autoload.php to your php.ini file

sudo apt-get install -y phpmyadmin apache2-utils
echo 'Include /etc/phpmyadmin/apache.conf' | sudo tee /etc/apache2/apache2.conf
sudo service apache2 restart


sudo add-apt-repository -r "deb http://archive.canonical.com/ precise partner"
sudo apt-get update

echo "Cleaning Up" && sudo apt-get -f install && sudo apt-get autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean

source ~/.bash_profile

exit 0
