import json
import requests

# src: https://uit.instructure.com/api/v1/courses/38579/users?include_inactive=true&include[]=avatar_url&include[]=enrollments&include[]=email&include[]=observed_users&include[]=can_be_removed&include[]=custom_links&per_page=100
with open("users.json") as f:
    students = json.load(f)

groups = []

# https://uit.instructure.com/api/v1/sections/49944/enrollments?include[]=can_be_removed&page=1&per_page=100 (gr1)
# https://uit.instructure.com/api/v1/sections/49947/enrollments?include[]=can_be_removed&page=1&per_page=100 (gr2)
# https://uit.instructure.com/api/v1/sections/49950/enrollments?include[]=can_be_removed&page=1&per_page=100 (gr3)
# https://uit.instructure.com/api/v1/sections/49952/enrollments?include[]=can_be_removed&page=1&per_page=100 (gr4)
# https://uit.instructure.com/api/v1/sections/49955/enrollments?include[]=can_be_removed&page=1&per_page=100 (gr5)
with open("enrollments_gr1.json") as f: groups.append(json.load(f))
with open("enrollments_gr2.json") as f: groups.append(json.load(f))
with open("enrollments_gr3.json") as f: groups.append(json.load(f))
with open("enrollments_gr4.json") as f: groups.append(json.load(f))
with open("enrollments_gr5.json") as f: groups.append(json.load(f))
    
with open("name-email.csv", "w") as f:
    for s in students:
        g_str = ""
        for i, g in enumerate(groups):
            for sg in g:
                if sg["user_id"] == s["id"]:
                    g_str = str(i + 1)
        #if g_str == "": print(s['name'])  # print teachers/TAs
        if g_str != "": # if student
            last_name,first_names = s['sortable_name'].split(", ")
            f.write(f"{s['name']},{s['email']},{s['email'].split('@')[0]},{last_name} {first_names.split()[0]},{first_names.split()[0]} {last_name},{g_str}\n")

