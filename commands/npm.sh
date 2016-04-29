#!/usr/bin/env bash

sudo apt-get install -y nodejs npm
sudo ln -s /usr/bin/nodejs /usr/bin/node

# Listing globally installed NPM packages and version
npm list -g --depth=0

# Listing outdated globally installed packages
npm outdated -g --depth=0

sudo npm install -g bower
sudo npm install -g gnomon
sudo npm uninstall -g gnomon
