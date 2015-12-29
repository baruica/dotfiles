#!/usr/bin/env bash

# LAMP
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

# PhpMyAdmin
sudo apt-get install -y phpmyadmin apache2-utils
echo 'Include /etc/phpmyadmin/apache.conf' | sudo tee /etc/apache2/apache2.conf
sudo service apache2 restart
