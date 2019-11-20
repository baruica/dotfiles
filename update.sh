#!/usr/bin/env bash
set -e

function cmd_exists
{
    hash "$1" >/dev/null 2>&1
}

function exec_if_cmd_exists
{
    cmd_exists "$1" && "$@"
}

readonly git_repos="git-radar
z
workspace/baruica/dotfiles"

for git_repo in ${git_repos}; do
    if [[ -d ~/${git_repo} ]]; then
        echo
        echo ">>> ${git_repo}"
        cd ~/"${git_repo}" || exit
        git up
        [[ -f composer.json ]] && exec_if_cmd_exists composer update
    fi
done

echo

if [[ -r ~/workspace/update.sh ]] && [[ -f ~/workspace/update.sh ]]; then
    sh ~/workspace/update.sh
fi

exec_if_cmd_exists exercism upgrade

exec_if_cmd_exists composer self-update
exec_if_cmd_exists composer global update

sudo apt update
sudo apt full-upgrade -y

exec_if_cmd_exists aptclean
