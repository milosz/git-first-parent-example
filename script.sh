#!/bin/bash

git init

touch readme.txt
git add readme.txt
git commit -m "initial import"

git checkout -b TRACK-1250 master
cat <<EOF | tee  readme.txt
# git first parent example
EOF
git add readme.txt
git commit -m "added initial header"
git mv readme.txt readme.md
git commit -m "renamed readme.txt to readme.md"

git checkout master
git merge --no-ff --no-edit TRACK-1250

git checkout -b TRACK-4320 master
cat <<EOF | tee  readme.md
# git first parent example
simple example to illustrate 'first-parent' option
EOF
git add readme.md
git commit -m "updated readme file"

git checkout -b TRACK-6850 master
cat <<EOF | tee script.sh
$(cat $0)
EOF
git add script.sh
git commit -m "added script.sh"

git checkout master
git merge --no-ff --no-edit TRACK-4320
git merge --no-ff --no-edit TRACK-6850
