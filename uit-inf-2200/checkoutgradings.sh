#!/bin/sh

# 'git push' gradings to all student projects
# will push all .md files in repo
# pushes everything to "gradings" branch

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
				# Check if 'gradings' branch exists
				# if not, create it
				# if it does, switch to it
				if ! git rev-parse --verify gradings >/dev/null 2>&1; then
						echo "Branch 'gradings' does not exist. Creating..."
						git checkout -b gradings
				else
						echo "Switching to existing 'gradings' branch..."
						git checkout gradings
				fi
        cd - > /dev/null
    else
        echo "Repo ${r} not found"
    fi
    echo
done
