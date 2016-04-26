#!/usr/bin/env bash

snap find
snap find name
snap find | grep search

sudo snap install package-name

# update
sudo snap refresh package-name

# list installed packages
snap list
snap list | grep search

sudo snap remove package-name

# view recent changes
snap changes
