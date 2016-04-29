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
