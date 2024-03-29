import json
import os
import shutil
import subprocess
from typing import List, Tuple

x = open("metadata.json", "w")

projects: List[Tuple[str, int]] = [
    ("ansible", 18),
    ("cookiecutter", 4),
    ("PySnooper", 3),
    ("spacy", 10),
    ("sanic", 5),
    ("httpie", 5),
    ("keras", 45),
    ("matplotlib", 30),
    ("thefuck", 32),
    ("pandas", 169),
    ("black", 15),
    ("scrapy", 40),
    ("luigi", 33),
    ("fastapi", 16),
    ("tornado", 16),
    ("tqdm", 9),
    ("youtube-dl", 43),
]


result = []
id = 0
for name, bug_count in projects:
    os.makedirs(name, exist_ok=True)
    for bug in range(1, bug_count):
        os.makedirs(os.path.join(name, f"{name}-{bug}"),exist_ok=True)
        for script in ["build_subject","config_subject","setup_subject","test_subject"]:
            shutil.copy(script,os.path.join(name, f"{name}-{bug}",script))
        id += 1
        proc = subprocess.Popen(
            ["./framework/bin/bugsinpy-info -p {} -i {}".format(name, bug)],
            stdout=subprocess.PIPE,
            shell=True,
        )

        (out, err) = proc.communicate()
        data = out.decode("utf-8")
        lines = data.split("\n")
        fix_commit = "N/A"
        bug_commit = "N/A"
        github_url = "N/A"
        for i, line in enumerate(lines):
            if line.startswith("Revision id"):
                fix_commit = lines[i + 1].strip()
            if line.startswith("Buggy id"):
                bug_commit = lines[i + 1].strip()
            if line.startswith("Github URL"):
                github_url = line.split(":")[1].strip()
        print(data)
        result.append(
            {
                "id": id,
                "subject": name,
                "bug_id": f"{name}-{bug}",
                "test_timeout": 5,
                "language": "python",
                "build_script": "build_subject",
                "config_script": "config_subject",
                "clean_script": "clean_subject",
                "test_script": "test_subject",
                "passing_test_identifiers": [],
                "count_pos": 0,
                "failing_test_identifiers": [],
                "count_neg": 0,
                "bug_commit": bug_commit,
                "fix_commit": fix_commit,
                "line_numbers": [],
                "dependencies": [],
            }
        )
        # input()

x.write(json.dumps(result, indent=4))
x.close()
