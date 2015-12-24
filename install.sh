#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

cd

ln -s ./dotfiles/.bash_profile
ln -s ./dotfiles/.bashrc
git clone https://github.com/michaeldfallen/git-radar .git-radar
./install_client.sh

sudo apt-get autoremove apport unity-lens-shopping
sudo gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

https://askubuntu.com/questions/141752/keyboard-shortcut-to-move-windows-between-monitors

sudo apt-get purge openjdk*
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

sudo apt-get update

sudo apt-get install -y build-essential
sudo apt-get install -y python-software-properties
sudo apt-get install -y software-properties-common
sudo apt-get install -y ubuntu-restricted-extras

sudo apt-get install -y bash-completion
sudo apt-get install -y bleachbit
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y git-core
sudo apt-get install -y htop
sudo apt-get install -y pv
sudo apt-get install -y tig
sudo apt-get install -y tree
sudo apt-get install -y vim
sudo apt-get install -y xclip

sudo apt-get install rubygems
#sudo apt-get install -y ruby-dev
sudo gem install rubygems-update
sudo gem install git-up

sudo update_rubygems
sudo gem update --system

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


sudo apt-get install -y phpmyadmin apache2-utils
echo 'Include /etc/phpmyadmin/apache.conf' | sudo tee /etc/apache2/apache2.conf
sudo service apache2 restart


echo "Cleaning Up" && sudo apt-get -f install && sudo apt-get autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean

wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash

# laptop tweaks
cd && wget -O .laptop-mode.sh http://drive.noobslab.com/data/improve-battery/laptop-mode
chmod +x .laptop-mode.sh && ./.laptop-mode.sh

# to undo/uninstall laptop tweaks
sudo apt-get autoremove indicator-cpufreq laptop-mode-tools && FSTABFile="noatime,nodiratime,discard,errors" && sudo sed -i -e "s/$FSTABFile/errors/g" "/etc/fstab" && sudo bash -c "echo 60 > /proc/sys/vm/swappiness" && sudo sed -i '/defaults,noatime,size=512M/d' /etc/fstab

. ~/.bash_profile

exit 0
