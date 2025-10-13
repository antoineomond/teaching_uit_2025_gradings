#!/usr/bin/bash

for r in $(cat to_grade.txt)
do
    #echo "${r}"
    if [ -d "${r}" ]; then
			cd "${r}"
			#echo "Switching to existing 'gradings' branch..."
			echo "${r} $(cat GRADING.md | grep -i passed)"
			cd - > /dev/null
		fi
done
