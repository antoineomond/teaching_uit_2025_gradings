import os
import csv
import subprocess

with open("name-email.csv") as f:
    name_email = [r for r in csv.reader(f)]
#print(name_email)
d = "/home/aomond/teaching_uit_2025/gradings/uit-inf-2200/assignment2/mips-simulator-submissions/mips-simulator-ase"
all_files = subprocess.check_output(f'find {d} -type f | grep -Ev ".git|.pdf|.png|.jpg|.jpeg"', shell=True).decode("utf-8").strip().split("\n")
matches = []
for f_name in all_files:
    with open(f_name) as f:
        print(f_name)
        for l in f.read().split("\n"):
            for ne in name_email:
                for e in ne[:-1]:
                    if e in l:
                        matches.append((e, ne, l))
print(matches)
#print(all_files)

# #!/usr/bin/bash
# 
# 
# while IFS=',' read -ra ADDR; do
#   for i in "${ADDR[@]}"; do
#     echo "$i"
#   done
# done < name-email.csv
