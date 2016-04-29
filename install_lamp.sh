#!/usr/bin/env bash

# LAMP
sudo apt-get -y purge php.*
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/php-7.0
sudo apt-get update
sudo apt-get install -y php php-cli php-curl php-intl php-mbstring php-pgsql php-xml
sudo apt-get install -y php5 php5-cli php5-curl php5-intl php5-mbstring php5-pgsql php5-xml
sudo apt-get install -y php5.6 php5.6-cli php5.6-curl php5.6-intl php5.6-mbstring php5.6-pgsql php5.6-xml
sudo apt-get install -y php7.0 php7.0-cli php7.0-curl php7.0-intl php7.0-mbstring php7.0-pgsql php7.0-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/5.6/cli/php.ini

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
