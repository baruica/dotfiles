#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

git clone https://github.com/baruica/dotfiles ~/dotfiles
ln -s ./dotfiles/.bashrc

git config --global user.name "Nelson da Costa"
git config --global user.email "ndc@octo.com"
git config --global include.path dotfiles/git/.gitconfig

git clone https://github.com/michaeldfallen/git-radar ~/git-radar
ln -s ~/git-radar/git-radar ~/bin/git-radar

sudo curl -LsS https://getcomposer.org/installer -o ~/bin/composer && sudo ln -s ~/bin/composer /usr/local/bin/composer
sudo curl -LsS https://symfony.com/installer -o ~/bin/symfony && sudo ln -s ~/bin/symfony /usr/local/bin/symfony

composer global require bamarni/symfony-console-autocomplete
composer global require fabpot/php-cs-fixer
