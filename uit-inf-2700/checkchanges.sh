#!/bin/sh

# 'git push' gradings to all student projects
# will push all .md files in repo
# pushes everything to "gradings" branch

# commit message
# change to your liking
commit_message="Added grading"

for r in $(cat group-3.txt)
do
    if [ -d "${r}" ]; then
        cd "${r}"
        if [ -n "$(git status --porcelain)" ]; then
					echo "${r}"
					git status
				fi
        cd - > /dev/null
    else
        echo "Repo ${r} not found"
    fi
    echo
done
