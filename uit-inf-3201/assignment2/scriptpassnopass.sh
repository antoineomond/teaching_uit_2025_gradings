#!/usr/bin/bash

for r in $(cat to_grade.txt)
do
    #echo "${r}"
    if [ -d "${r}" ]; then
			cd "${r}"
			#echo "Switching to existing 'gradings' branch..."
			git checkout gradings > /dev/null 2> /dev/null
			echo "${r} $(cat gradings/assignment1.md | grep -i passed)"
			cd - > /dev/null
		fi
done
