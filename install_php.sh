#!/usr/bin/env bash

sudo apt -y purge php.*

sudo add-apt-repository -yes ppa:ondrej/php
sudo apt-get update

sudo apt install -y php8.0 php8.0-{bcmath,cli,curl,intl,mbstring,pgsql,xml}

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/8.0/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/8.0/cli/php.ini

sudo apt clean
sudo apt autoremove
