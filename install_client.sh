#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

cd

git config --global user.name "Nelson DA COSTA"
git config --global user.email "n.dacosta@meetic-corp.com"
git config --global include.path ~/dotfiles/git/.gitconfig
