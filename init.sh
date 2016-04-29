#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

git config --global user.name "Nelson da Costa"
git config --global user.email "ndc@octo.com"
git config --global include.path dotfiles/git/.gitconfig
