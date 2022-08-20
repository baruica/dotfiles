#!/usr/bin/env bash
set -e

function cmd_exists() {
    hash "$1" &>/dev/null
}

readonly git_repos="git-radar
baruica/dotfiles"

for git_repo in ${git_repos}; do
    if [[ -d ~/${git_repo} ]]; then
        echo && echo ">>> ${git_repo}"
        cd ~/"${git_repo}" || exit
        git up
        cmd_exists composer && [[ -f composer.json ]] && composer update
    fi
done

echo

if [[ -r ~/update.sh ]] && [[ -f ~/update.sh ]]; then
    sh ~/update.sh
fi

cmd_exists npm && echo && echo ">>> npm" && npm update -g

if [[ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    echo && echo ">>> sdkman" && sdk selfupdate && sdk update
fi

echo
sudo apt -y update && sudo apt -y full-upgrade --allow-downgrades

echo && echo ">>> cleanup"
sudo apt clean -y
sudo apt autoremove -y --purge
