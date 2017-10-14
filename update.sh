#!/usr/bin/env bash

cmd_exists()
{
    hash "$1" >/dev/null 2>&1
}

exec_if_cmd_exists()
{
    cmd_exists "$1" && "$@"
}

sudo_exec_if_cmd_exists()
{
    cmd_exists "$1" && sudo "$@"
}

#exec_if_cmd_exists composer self-update
exec_if_cmd_exists composer global update
exec_if_cmd_exists exercism upgrade

#sudo_exec_if_cmd_exists update_rubygems
#sudo_exec_if_cmd_exists gem update --system

#sudo_exec_if_cmd_exists npm i -g npm
#sudo_exec_if_cmd_exists npm update -g

sudo apt update
sudo apt full-upgrade -y

readonly git_repos="git-radar
workspace/baruica/dotfiles
workspace/katas/kata-starter"

for git_repo in ${git_repos}; do
    if [[ -d ${HOME}/${git_repo} ]]; then
        echo
        echo ">>> ${git_repo}"
        cd "${HOME}/${git_repo}" || exit
        git up
        [[ -f composer.json ]] && composer update
    fi
done

if [[ -r $HOME/workspace/update.sh ]] && [[ -f $HOME/workspace/update.sh ]]; then
    sh "$HOME/workspace/update.sh"
fi

exec_if_cmd_exists aptclean
