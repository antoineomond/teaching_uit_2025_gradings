import os
import csv
import subprocess
import sys

with open("name-email.csv") as f:
    name_email = [r for r in csv.reader(f)]
if len(sys.argv) < 2:
    print("need assignments dir")
    exit()
abs_path = f"/home/aomond/teaching_uit_2025/gradings/uit-inf-2200/assignment2/{sys.argv[1]}"
all_matches = []
for d in os.listdir(abs_path):
    student_dir = f"{abs_path}/{d}"
    
    # Check if empty repo
    r = subprocess.check_output(f"git -C {student_dir} log -1 --pretty=format:'%an %s'", shell=True).decode("utf-8").strip()
    if r == "github-classroom[bot] Initial commit":
        all_matches.append((d, "Empty repository","",""))
        
    # Check report
    try:
        #all_files = subprocess.check_output(f'find {student_dir} -type f | grep -Ev ".git|.png|.jpg|.jpeg|__pycache__|.DS_Store|.zip"', shell=True).decode("utf-8").strip().split("\n")
        all_files = subprocess.check_output(f'find {student_dir} -type f | grep .pdf', shell=True).decode("utf-8").strip().split("\n")
        for f_name in all_files:
            try:
                is_pdf = subprocess.check_output(f'file -b "{f_name}" | grep -o "PDF"', shell=True).decode("utf-8").strip() == "PDF"
            except subprocess.CalledProcessError as e:
                is_pdf = False
            if is_pdf:
                for ne in name_email:
                    search_string = "|".join(ne[:-1])
                    try:
                        g = subprocess.check_output(f'pdfgrep -Pi --cache "{search_string}" "{f_name}"', shell=True)
                        #m = f"{ne[0]},{ne[1]},{ne[-1]}"
                        m = (d, ne[0], ne[1], ne[-1])
                        if m not in all_matches:
                            all_matches.append(m)
                    except subprocess.CalledProcessError as e:
                        continue
    except subprocess.CalledProcessError:
        pass
        
    # Check commit logs
    r = subprocess.check_output(f"git -C {student_dir} log --pretty=format:'%an %ae'", shell=True).decode("utf-8").strip()
    for l in r.split("\n"):
        *n,e = l.split()
        for ne in name_email:
            if " ".join(n) in ne or e in ne:
                #m = f"{ne[0]},{ne[1]},{ne[-1]}"
                m = (d, ne[0], ne[1], ne[-1])
                if m not in all_matches:
                    all_matches.append(m)
    
max_size_0 = len(max((k[0] for k in all_matches), key=len))
max_size_1 = len(max((k[1] for k in all_matches), key=len))
max_size_2 = len(max((k[2] for k in all_matches), key=len))
max_size_3 = len(max((k[3] for k in all_matches), key=len))
for k in sorted(all_matches, key=lambda x: x[0]):
    print(f"{k[0]}{' '*(max_size_0 - len(k[0]))} | {k[1]}{' '*(max_size_1 - len(k[1]))} | {k[2]}{' '*(max_size_2 - len(k[2]))} | {k[3]}")
exit()
max_size = len(max((k for k in all_matches.keys()), key=len))
max_size_v0 = len(max((k[0] for k in all_matches.values()), key=len))
max_size_v1 = len(max((k[1] for k in all_matches.values()), key=len))
for k in sorted(all_matches.keys()):
    print(f"{k}{' '*(max_size-len(k))} | {all_matches[k][0]}{' '*(max_size_v0-len(all_matches[k][0]))}")
