#!/usr/bin/env bash
set -e

readonly git_repos="git-radar
workspace/baruica/dotfiles"

for git_repo in ${git_repos}; do
    if [[ -d ~/${git_repo} ]]; then
        echo
        echo ">>> ${git_repo}"
        cd ~/"${git_repo}" || exit
        git up
        [[ -f composer.json ]] && composer update
    fi
done

echo

if [[ -r ~/workspace/update.sh ]] && [[ -f ~/workspace/update.sh ]]; then
    sh ~/workspace/update.sh
fi

exercism upgrade
composer self-update
composer global update
yes | symfony self:update

sudo apt update
sudo apt full-upgrade -y

sudo apt clean -y
sudo apt autoremove -y --purge
