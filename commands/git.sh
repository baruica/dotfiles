git config --local user.email "barui.ca@gmail.com"
git config --local user.name "Nelson da Costa"

# git: search for a specific string
# search all commits which contain the string "console.log" in the patch content
# it doesn't search in the commit message or information (username, date, ...)
# and it's only searching in the patch content and not in the lines added before and after the patch content.
git log -S console.log --author lgiraudel --before="2013-10-01 00:00" --after="2013-06-01 00:00" -- web/js

# Avoiding 'git clone' when you just need an export
git archive --remote=<url> --format=tgz master | tar xvz

# show the file changes of the x last commits
git show --pretty=oneline --name-status HEAD~x..HEAD

# liste les branches locales et distantes
git branch -a

# ajoute les 1ères lignes de commit et, pour les trackées, l'état du tracking
git branch -vv

# rename a local branch
git branch -m feat-3132 quiz-acceditations

# delete local branch
git branch -D mybranch

# Delete local and remote together
git push remotename --delete :mybranch

# La première fois que vous poussez une branche que vous voulez tracker ensuite, pensez à caler à la volée le tracking
git push -u origin stats

# instead of
git push origin current-branch-5544
# just use
git push origin head
# git obtains the current branch from head

# who worked on the project
git shortlog --numbered --summary HEAD
#  1834  Charles-Eric Gorron
#   859  Kieu Anh Tuan
#   427  clement.gautier
#   376  Clement Gautier
#   308  qzhang
#   212  Nelson da Costa

# show sorted list by number of commits for each author in all branches
git shortlog -s -n --all

git grep -i todo | wc -l
# 31

# see all commits from version 8.22.0
tig 8.22.0..HEAD

# fix permissions
git diff -p | grep -E '^(diff|old mode|new mode)' | sed -e 's/^old/NEW/;s/^new/old/;s/^NEW/new/' | git apply
git diff -p -R | grep -E '^(diff|(old|new) mode)' | git apply

git checkout master
git merge --no-ff dev-branch

# empty initial commit
git ci --allow-empty -m "init commit"

# edit last commit's msg (--amend) and add currently non-committed files to that last commit (-a)
git ci --amend -a

# backup a repo as a zip file
git archive --format zip --output ~/out/repos/emo.zip master


# show list of modified/added files between 2 branches
git diff --name-status master..<branch>
# M       composer.json
# A       composer.lock

git diff --name-only master..<branch>
# composer.json
# composer.lock

# ignore whitespaces
git diff -w
