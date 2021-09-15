#!/usr/bin/env bash
set -e

readonly git_repos="git-radar
baruica/dotfiles"

for git_repo in ${git_repos}; do
    if [[ -d ~/${git_repo} ]]; then
        echo && echo ">>> ${git_repo}"
        cd ~/"${git_repo}" || exit
        git up
        [[ -f composer.json ]] && composer update
    fi
done

echo

if [[ -r ~/update.sh ]] && [[ -f ~/update.sh ]]; then
    sh ~/update.sh
fi

echo && echo ">>> composer" && composer self-update
echo && echo ">>> composer global" && composer global update
echo && echo ">>> symfony" && yes | symfony self:update
echo && echo ">>> npm" && npm update -g

source "$HOME/.sdkman/bin/sdkman-init.sh"
echo && echo ">>> sdkman" && sdk selfupdate && sdk update

echo
sudo apt -y update
sudo apt -y full-upgrade --allow-downgrades

echo && echo ">>> cleanup"
sudo apt clean -y
sudo apt autoremove -y --purge
