with open("repo-name.md") as f:
    all_names = f.read().strip().split("\n")
    
with open("repo-githubid.md") as f:
    all_githubid = f.read().strip().split("\n")
    
all_things = []
for url, names in [k.split("|") for k in all_names]:
    for other_url, githubid in [k.split("|") for k in all_githubid]:
        if url == other_url:
            all_things.append((url.strip(), names.strip(), githubid.strip()))

max_size_k0 = len(max(all_things, key=lambda x: len(x[0]))[0])
max_size_k1 = len(max(all_things, key=lambda x: len(x[1]))[1])
#mk1 = max(all_things, key=lambda x: len(x[0]) + len(x[1]))
#max_size_k1 = len(mk1[0]) + len(mk1[1])
for k in all_things:
    print(f"{k[0]}{' '*(max_size_k0-len(k[0]))} | {k[1]}{' '*(max_size_k1-len(k[1]))} | {k[2]}")
