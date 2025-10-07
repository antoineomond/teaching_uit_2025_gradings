#!/usr/bin/bash

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
    #echo "${r}"
    if [ -d "${r}" ]; then
			cd "${r}"
			#echo "Switching to existing 'gradings' branch..."
			git checkout gradings > /dev/null 2> /dev/null
			echo "${r} $(cat gradings/assignment1.md | grep -i passed)"
			cd - > /dev/null
		fi
done
