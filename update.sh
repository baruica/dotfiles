#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade -y

hash update_rubygems >/dev/null 2>&1 && sudo update_rubygems
hash gem >/dev/null 2>&1 && sudo gem update --system
hash npm >/dev/null 2>&1 && sudo npm update -g

hash composer >/dev/null 2>&1 && composer self-update && composer global update
hash symfony >/dev/null 2>&1 && symfony self-update
hash melody >/dev/null 2>&1 && melody self-update

readonly git_repos=".git_template
git-radar
git-standup
workspace/baruica/document-storage
workspace/baruica/document-storage-aws-s3
workspace/baruica/xml
workspace/octo/octoboard"

for git_repo in ${git_repos}; do
    echo
    echo ">>> ${git_repo}"
    cd ~/${git_repo}
    git up
    [ -f composer.json ] && composer update
done
