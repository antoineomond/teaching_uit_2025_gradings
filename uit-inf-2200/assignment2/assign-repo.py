import os
import csv
import subprocess

with open("name-email.csv") as f:
    name_email = [r for r in csv.reader(f)]
abs_path = "/home/aomond/teaching_uit_2025/gradings/uit-inf-2200/assignment2/mips-simulator-submissions"
#d = "/home/aomond/teaching_uit_2025/gradings/uit-inf-2200/assignment2/mips-simulator-submissions/mips-simulator-assignment-2"
all_matches = {}
for d in os.listdir(abs_path):
    #print(d)
    student_dir = f"{abs_path}/{d}"
    matches = []
    try:
        all_files = subprocess.check_output(f'find {student_dir} -type f | grep -Ev ".git|.png|.jpg|.jpeg|__pycache__|.DS_Store|.zip"', shell=True).decode("utf-8").strip().split("\n")
        #all_files = subprocess.check_output(f'find {student_dir} -type f | grep .pdf', shell=True).decode("utf-8").strip().split("\n")
        for f_name in all_files:
            if not f_name.endswith(".pdf"):
                with open(f_name) as f:
                    #print(f_name)
                    try: 
                        for l in f.read().split("\n"):
                            for ne in name_email:
                                for e in ne[:-1]:
                                    if e in l:
                                        m = f"{ne[0]},{ne[1]},{ne[-1]}"
                                        if m not in matches:
                                            matches.append(m)
                    except UnicodeDecodeError as e:
                        print(f_name)
                        print(e)
            else:
                for ne in name_email:
                    #search_string = "|".join(ne[:-1])
                    search_string = "|".join(ne[:-1])
                    try:
                        g = subprocess.check_output(f'pdfgrep -Pi --cache "{search_string}" "{f_name}"', shell=True)
                        m = f"{ne[0]},{ne[1]},{ne[-1]}"
                        if m not in matches:
                            matches.append(m)
                    except subprocess.CalledProcessError as e:
                        continue
                    #matches.append((e, ne, f_name))
    except subprocess.CalledProcessError:
        pass
    #for k in matches:
    #    print(k)
    
    if matches == []:
        r = subprocess.check_output(f"git -C {student_dir} log -1 --pretty=format:'%an %s'", shell=True).decode("utf-8").strip()
        #print(r, r == "github-classroom[bot] Initial commit")
        if r == "github-classroom[bot] Initial commit":
            matches.append("Empty repository")
    all_matches[d] = matches
    #print(all_files)
max_size = len(max((k for k in all_matches.keys()), key=len))
for k,v in all_matches.items():
    print(f"{k} {' '*(max_size-len(k))} | {v}")
