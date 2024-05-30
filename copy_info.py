import json
import os
import shutil
import subprocess
from typing import List, Tuple


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
        bug_info_path = os.path.join("projects", name, "bugs", str(bug), "bug.info")
        dest_dir = os.path.join(name, f"{name}-{bug}")
        shutil.copy2(bug_info_path, dest_dir)

