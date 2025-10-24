#!/usr/bin/bash

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
merciech
yoursteelingmyname
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
