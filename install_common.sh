#!/usr/bin/env bash

sudo apt-add-repository ppa:ansible/ansible

# Java
sudo apt-get purge openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y build-essential python-software-properties software-properties-common ubuntu-restricted-extras
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default

sudo apt-get install -y bash-completion curl git git-core htop pv tig tree vim xclip

# git-up
sudo apt-get install -y ruby ruby-dev rubygems-integration
sudo gem install git-up

sudo gem install rubygems-update

# fonts
gksu nautilus /usr/share/fonts/truetype # copy font files into a dir
sudo fc-cache -f -v                     # reload fonts


# LAMP
sudo apt-get -y purge php.*
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php php-cli php-curl php-intl php-mbstring php-pgsql php-xml
sudo apt-get install -y php5.6 php5.6-cli php5.6-curl php5.6-intl php5.6-mbstring php5.6-pgsql php5.6-xml
sudo apt-get install -y php7.0 php7.0-cli php7.0-curl php7.0-intl php7.0-mbstring php7.0-pgsql php7.0-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/5.6/cli/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/7.0/cli/php.ini

sudo apt-get install -y apache2
sudo apt-get install -y libapache2-mod-php5

# Set your server name (Avoid error message on reload/restart of Apache)
echo 'ServerName localhost' >> /etc/apache2/httpd.conf

sudo a2enmod vhost_alias rewrite
sudo service apache2 restart

sudo apt-get install -y mysql-server
sudo apt-get install -y php5-mysql
sudo apt-get install -y php5-curl
sudo apt-get install -y php5-intl
sudo apt-get install -y php5-mcrypt
sudo php5enmod mcrypt
