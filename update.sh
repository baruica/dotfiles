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

exec_if_cmd_exists composer self-update
exec_if_cmd_exists composer global update
exec_if_cmd_exists symfony self-update
exec_if_cmd_exists melody self-update

sudo_exec_if_cmd_exists update_rubygems
sudo_exec_if_cmd_exists gem update --system
sudo_exec_if_cmd_exists npm update -g

sudo apt-get update
sudo apt-get upgrade -y
sudo snap refresh

readonly git_repos="git-radar
workspace/baruica/document-storage
workspace/baruica/document-storage-aws-s3
workspace/baruica/dotfiles
workspace/baruica/symfony-skeleton
workspace/baruica/xml
workspace/katas/kata-starter"

for git_repo in ${git_repos}; do
    if [ -d ~/"${git_repo}" ]; then
        echo
        echo ">>> ${git_repo}"
        cd ~/"${git_repo}" || exit
        git up
        [ -f composer.json ] && composer update
    fi
done

exec_if_cmd_exists aptclean
