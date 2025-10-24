#!/bin/sh

# 'git push' gradings to all student projects
# will push all .md files in repo
# pushes everything to "gradings" branch

set -e

if [[ $# -eq 0 ]]; then
	echo "specify assignment repo"
	exit
fi

commit_message="Added grading"
repos="$(cat $1-groups.txt)"
cd "$1"

for r in ${repos}
do
    echo "${r}"
    if [ -d "${r}" ]; then
        cd "${r}"

        # Check if there are changes
        if [ -n "$(git status --porcelain | grep .md)" ]; then
            echo "Adding grading for ${r}..."
						
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

            # Add all .md files and commit with message
            git add '*.md'
            git commit -m "${commit_message}"

            # Push the changes to the "gradings" branch
            git push origin "${target_branch}"

            echo "Grading added"
        else
            echo "No changes in ${r}. Skipping push"
        fi

        cd - > /dev/null

    else
        echo "Repo ${r} not found"
    fi
    echo
done
