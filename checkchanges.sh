#!/bin/sh

set -e

if [[ $# -eq 0 ]]; then
	echo "specify assignment repo"
	exit
fi

repos="$(cat $1-groups.txt)"
cd "$1"

for r in ${repos}
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
