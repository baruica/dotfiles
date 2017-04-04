#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_6.x -o ~/nodesource_setup.sh
sudo bash ~/nodesource_setup.sh
sudo apt-get install -y nodejs

# update npm using npm itself
sudo npm install -g npm

npm prune && npm install

# Listing globally installed NPM packages and version
npm list -g --depth=0

# Listing outdated globally installed packages
npm outdated -g --depth=0

sudo npm install -g bower
