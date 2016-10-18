#!/usr/bin/env bash

DIR=$(dirname $(readlink -m $0))

sudo ubuntu-drivers autoinstall

sudo apt-get install fonts-hack-ttf

cp ${DIR}/.bash_profile_dist ~/.bash_profile
ln -s ${DIR}/.bashrc ~/.bashrc
source ~/.bashrc

git config --global user.name "Nelson da Costa"
git config --global user.email "ndc@octo.com"
git config --global include.path ${DIR}/git/.gitconfig

git clone https://github.com/michaeldfallen/git-radar ~/git-radar
ln -s ~/git-radar/git-radar ~/bin/git-radar

sudo curl -LsS https://getcomposer.org/installer -o ~/bin/composer && sudo ln -s ~/bin/composer /usr/local/bin/composer
sudo curl -LsS https://symfony.com/installer -o ~/bin/symfony && sudo ln -s ~/bin/symfony /usr/local/bin/symfony
sudo sh -c "curl http://get.sensiolabs.org/melody.phar -o ~/bin/melody && chmod u+x ~/bin/melody" && sudo ln -s ~/bin/melody /usr/local/bin/melody

composer global require bamarni/symfony-console-autocomplete
composer global require fabpot/php-cs-fixer

git clone https://github.com/greg0ire/git_template ~/.git_template
