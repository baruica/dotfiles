#!/bin/sh -

composer show -i
composer show -i <package>


# git: search for a specific string
# search all commits which contain the string "console.log" in the patch content
# it doesn't search in the commit message or information (username, date, ...)
# and it's only searching in the patch content and not in the lines added before and after the patch content.
git log -S console.log --author lgiraudel --before="2013-10-01 00:00" --after="2013-06-01 00:00" -- web/js
