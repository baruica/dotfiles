#!/usr/bin/env bash

hash composer >/dev/null 2>&1 && composer self-update && composer global update
hash symfony >/dev/null 2>&1 && symfony self-update
hash melody >/dev/null 2>&1 && melody self-update

hash update_rubygems >/dev/null 2>&1 && sudo update_rubygems
hash gem >/dev/null 2>&1 && sudo gem update --system
hash npm >/dev/null 2>&1 && sudo npm update -g

readonly git_repos="git-radar
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
