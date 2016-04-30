#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

backup_dir=~/dotfiles_backup

mkdir -p ${backup_dir}/.config

to_backup_list="Documents
.gitconfig
.vim
.vimrc
.WebIde90
.WebIde95
www/zip"

for to_backup in ${to_backup_list}
do
    [ -e ~/${to_backup} ] && cp -R ~/${to_backup} ${backup_dir}/
done

exit 0
