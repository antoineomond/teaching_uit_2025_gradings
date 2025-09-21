#!/bin/sh

# 'git clone/pull' all student projects in 'repos'
#
# Please modify 'repos' for the students of your group

repos='
AlanDemirbas
dajes8144
caa037
Tigergutt33
stixxert
borkbr
Confibula
SanderGott
Jebus201
ebheines
HansHjermundrud
maxtwotouch
mkr176
IverMortensen
nergaard02
retorded
KristianHarvey
MaltheB
737BassTP
RubenRogne
Krornes
Danispeed
ExoEfe
TheodorTredal
Voldset
VegardChr
henriksenjoakim
'

# missing
# Vegard Christensen  (good)
# Ivan Ellefsen
# Joakim Henriksen (good)
# Chloé Mercier
# Robby Varun Veerasingam (don't do it)
# Yevhen Verkhalantsev 
# Tetiana Verkhalantseva 

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
        git clone git@githubperso:INF-3201-2025/assignment1-"${r}".git "${r}"
    fi
    echo
done
