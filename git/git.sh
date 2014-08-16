#!/usr/bin/env bash

# git: search for a specific string
# search all commits which contain the string "console.log" in the patch content
# it doesn't search in the commit message or information (username, date, ...)
# and it's only searching in the patch content and not in the lines added before and after the patch content.
git log -S console.log --author lgiraudel --before="2013-10-01 00:00" --after="2013-06-01 00:00" -- web/js

# Avoiding 'git clone' when you just need an export
git archive --remote=<url> --format=tgz master | tar xvz

# show the file changes of the x last commits
git show --pretty=oneline --name-status HEAD~x..HEAD

# delete local branch
git branch -D mybranch

# Delete local and remote together
git push remotename --delete :mybranch

# who worked on the project
git shortlog --numbered --summary HEAD
#  1834  Charles-Eric Gorron
#   859  Kieu Anh Tuan
#   427  clement.gautier
#   376  Clement Gautier
#   308  qzhang
#   212  Nelson da Costa

git grep -i todo | wc -l
# 31
