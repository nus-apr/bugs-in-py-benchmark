import os
import json
import shutil
from os.path import join

x = open("meta-data-test.json")
contents = json.load(x)
x.close()

for entry in contents:
    dest_dir = join(entry["subject"],entry["bug_id"])
    bug_info = join(dest_dir, "bug.info")
    bug_info = open(bug_info, "r")
    lines = bug_info.readlines()
    python_version = ""
    # Iterate through lines and find the python_version
    for line in lines:
        if line.startswith('python_version'):
            python_version = line.split('=')[1].replace("\"", "").strip()
            break
    entry["benchmark"] = "bugsinpy"
    entry["python_version"] = python_version

y = open("meta-data-test.json", "w")
json.dump(contents, y, indent=4)
y.close()
