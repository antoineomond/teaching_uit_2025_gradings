#!/bin/sh

# 'git clone/pull' all student projects in 'repos'
#
# Please modify 'repos' for the students of your group

repos='
tbo066
pbr027
ada118
todan0741
aneri9852
trkal4430
likli8138
jla149
tla114
ommos0357
thnyg9624
raols3585
jso078
est135
trurn9229
hva028
'

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
        git clone git@inf2700.cs.uit.no:"${r}"/"${r}".git "${r}"
    fi
    echo
done
