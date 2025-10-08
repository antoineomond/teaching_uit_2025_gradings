#!/bin/sh

# 'git push' gradings to all student projects
# will push all .md files in repo
# pushes everything to "gradings" branch

# commit message
# change to your liking
commit_message="Added grading"

for r in $(cat group-3.txt)
do
    echo "${r}"
    if [ -d "${r}" ]; then
        cd "${r}"

        # Check if there are changes
        if [ -n "$(git status --porcelain)" ]; then
            echo "Adding grading for ${r}..."

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

            # Add all .md files and commit with message
            git add '*.md'
            git commit -m "${commit_message}"

            # Push the changes to the "gradings" branch
            git push -u origin gradings

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
