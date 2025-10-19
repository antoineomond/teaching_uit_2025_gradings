import sys

if len(sys.argv) < 2:
    print("Need assignments dir")
    exit()

with open(f"repo-name-{sys.argv[1]}.md") as f:
    all_names = f.read().strip().split("\n")
    
with open(f"repo-githubid-{sys.argv[1]}.md") as f:
    all_githubid = f.read().strip().split("\n")
    
all_things = []
for url, name, email, group_id in [k.split(",") for k in all_names]:
    for other_url, githubid in [k.split(",") for k in all_githubid]:
        url = url.strip()
        other_url = other_url.strip()
        if url == other_url:
            all_things.append((url.strip(), name.strip(), email.strip(), group_id, githubid.strip()))

max_size_k0 = len(max(all_things, key=lambda x: len(x[0]))[0])
max_size_k1 = len(max(all_things, key=lambda x: len(x[1]))[1])
max_size_k2 = len(max(all_things, key=lambda x: len(x[2]))[2])
max_size_k3 = len(max(all_things, key=lambda x: len(x[3]))[3])
max_size_k4 = len(max(all_things, key=lambda x: len(x[4]))[4])
for k in all_things:
    print(f"{k[0]}{' '*(max_size_k0-len(k[0]))},{k[1]}{' '*(max_size_k1-len(k[1]))},{k[2]}{' '*(max_size_k2-len(k[2]))},{k[3]}{' '*(max_size_k3-len(k[3]))},{k[4]}{' '*(max_size_k4-len(k[4]))}")
