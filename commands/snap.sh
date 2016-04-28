#!/usr/bin/env bash

snap find
snap find package-name
snap find | grep search

sudo snap install package-name

# update one package
sudo snap refresh package-name

# list installed packages
snap list
snap list | grep search

sudo snap remove package-name

# view recent changes
snap changes
