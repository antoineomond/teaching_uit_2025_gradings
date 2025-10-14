import subprocess

# Take student ids and repo url (last two cols)
command = """gh classroom accepted-assignments --per-page 100 --assignment-id 858010 | awk -F '\t' '{
  for (n = 1; n >= 0; n--) {
    idx = NF - n
    if (idx >= 1) printf "%s\t", $(idx)
    else printf "\t"  # print empty if not enough fields
  }
  print ""
}'
"""
r = subprocess.check_output(command, shell=True).decode("utf-8").strip().split("\n")
all_names = {}
for k in r:
    if len(k.split()) < 2:
        continue
    *students,url = k.split()
    # Don't take lines that do not correspond to student repo (e.g., headers)
    if url.startswith("https://"):
        url = url.replace("https://github.com/uit-inf-2200/", "")
        all_names[url] = students

max_size = len(max((k for k in all_names.keys()), key=len))
for k in sorted(all_names.keys()):
    print(f"{k} {' '*(max_size-len(k))} | {all_names[k]}")
