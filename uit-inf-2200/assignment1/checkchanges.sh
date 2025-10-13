#!/bin/sh

repos='
microbenchmark-group
microbenchmark-fent-salesman
microbenchmark-oblig1
microbenchmark-theodor-san-co
microbenchmark-spaghetti
microbenchmark-assignment1
microbenchmark-timeo
microbenchmark-g-b
microbenchmark-paper
microbenchmark-abdullahi-julian
microbenchmark-ahmed
microbenchmark-super-awesome-team-name-2
'
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
