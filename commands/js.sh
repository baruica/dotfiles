#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_6.x -o ~/nodesource_setup.sh
sudo bash ~/nodesource_setup.sh
sudo apt install -y nodejs

# update npm using npm itself
sudo npm install -g npm

npm prune && npm install

# Listing globally installed NPM packages and version
npm list -g --depth=0

# Listing outdated globally installed packages
npm outdated -g --depth=0

sudo npm install -g bower
sudo npm install -g grunt-cli

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
