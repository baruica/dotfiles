#!/usr/bin/env bash
set -e

readonly git_repos="git-radar
workspace/baruica/dotfiles"

for git_repo in ${git_repos}; do
    if [[ -d ~/${git_repo} ]]; then
        echo && echo ">>> ${git_repo}"
        cd ~/"${git_repo}" || exit
        git up
        [[ -f composer.json ]] && composer update
    fi
done

echo

if [[ -r ~/workspace/update.sh ]] && [[ -f ~/workspace/update.sh ]]; then
    sh ~/workspace/update.sh
fi

echo && echo ">>> exercism" && exercism upgrade
echo && echo ">>> composer" && composer self-update
echo && echo ">>> composer global" && composer global update
echo && echo ">>> symfony" && yes | symfony self:update

echo && echo ">>> java"
if [[ -s ~/.sdkman/bin/sdkman-init.sh ]]; then
    source ~/.sdkman/bin/sdkman-init.sh
    sdk selfupdate
    sdk update
    sdk upgrade java
fi

echo
sudo apt update
sudo apt full-upgrade -y

echo && echo ">>> cleanup"
sudo apt clean -y
sudo apt autoremove -y --purge
