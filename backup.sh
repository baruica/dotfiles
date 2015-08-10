#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

backup_dir=~/dotfiles_backup

mkdir -p ${backup_dir}/.config

to_backup_list=".bash_profile_local
Documents
.gitconfig
.vim
.vimrc
.WebIde80
.WebIde90
www"

to_backup_config_list="google-chrome
google-chrome-beta
gtk-2.0
gtk-3.0"

for to_backup in ${to_backup_list}
do
    cp -R ~/${to_backup} ${backup_dir}
done

for to_backup_config in ${to_backup_config_list}
do
    echo ~/.config/${to_backup_config}
    #cp -R ~/.config/${to_backup_config} ${backup_dir}/.config/
done
