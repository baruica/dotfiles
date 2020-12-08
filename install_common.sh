#!/usr/bin/env bash

sudo apt remove -y apport apport-gtk

sudo add-apt-repository -yes multiverse
sudo apt install -y bash-completion blueman chrome-gnome-shell curl git htop jq keychain neofetch shellcheck tree ubuntu-restricted-extras xclip

# Java
sudo apt purge -y openjdk*

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 15.0.9.hs-adpt

sudo apt install -y maven

sudo add-apt-repository -yes ppa:cwchien/gradle
sudo apt update
sudo apt install -y gradle

# PHP
sudo apt -y purge php.*

sudo add-apt-repository -yes ppa:ondrej/php
sudo apt update

readonly PHP_VERSION="7.4"
sudo apt install -y php$PHP_VERSION php$PHP_VERSION-bcmath php$PHP_VERSION-cli php$PHP_VERSION-curl php$PHP_VERSION-intl php$PHP_VERSION-mbstring php$PHP_VERSION-pgsql php$PHP_VERSION-xml

sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/$PHP_VERSION/apache2/php.ini
sudo sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php/$PHP_VERSION/cli/php.ini

sudo apt clean
sudo apt autoremove
