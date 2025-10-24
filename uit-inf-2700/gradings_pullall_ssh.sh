#!/bin/bash

set -e

# 'git clone/pull' all student projects in 'repos'
#
# Please modify 'repos' for the students of your group

for r in $(cat group-3.txt)
do
    echo "${r}"
    if [ -d "${r}" ]; then
        cd "${r}"

        # Check if 'master' or 'main' branch exists
				if [[ -n $(git ls-remote -b origin master) ]]; then
            target_branch="master"
				elif [[ -n $(git ls-remote -b origin main) ]]; then
            target_branch="main"
        else
            echo "\033[0;31mNeither 'master' nor 'main' branch exists in the remote for ${r}. Skipping repo.\033[0m"
            cd - > /dev/null
            continue
        fi

        echo "Switching to ${target_branch} branch..."
        git checkout ${target_branch}

        echo "pulling ${r}"
        git pull origin ${target_branch}
				if [[ -n $(git ls-remote -b origin gradings) ]]; then
					echo "merge ${target_branch} into gradings"
					git checkout gradings
					git pull origin gradings
					git merge -m "merge commit" ${target_branch}
				fi
        cd - > /dev/null
    else
        echo "cloning ${r}"
        git clone git@inf2700.cs.uit.no:"${r}"/"${r}".git "${r}"
    fi
    echo
done
