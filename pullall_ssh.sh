#!/bin/sh

# 'git clone/pull' all student projects in 'repos'
#
# Please modify 'repos' for the students of your group

set -e

if [[ $# -eq 0 ]]; then
	echo "specify assignment repo"
	exit
fi

repos="$(cat $1-groups.txt)"
cd "$1"

for r in ${repos}
do
    echo "${r}"
    if [ -d "${r}" ]; then
        cd "${r}"

        # Check if 'master' or 'main' branch exists
        if git ls-remote --exit-code --heads origin master >/dev/null 2>&1; then
            target_branch="master"
        elif git ls-remote --exit-code --heads origin main >/dev/null 2>&1; then
            target_branch="main"
        else
            echo "\033[0;31mNeither 'master' nor 'main' branch exists in the remote for ${r}. Skipping repo.\033[0m"
            cd - > /dev/null
            continue
        fi

        echo "Switching to ${target_branch} branch..."
        git checkout ${target_branch}

        echo "pulling ${r}"
        git pull
        cd - > /dev/null
    else
        echo "cloning ${r}"
        git clone git@githubperso:uit-inf-2200/"${r}".git 
    fi
    echo
done
