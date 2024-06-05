import os
import json
import shutil
from os.path import join
with open("meta-data.json") as f:
    data = json.load(f)
    for entry in data:
        dest_dir = join(entry["subject"],entry["bug_id"])
        if os.path.exists(join(dest_dir, "Dockerfile")):
            os.remove(join(dest_dir, "Dockerfile"))
        if os.path.exists(join(dest_dir, "darjeeling.yml")):
            os.remove(join(dest_dir, "darjeeling.yml"))
        # if entry["subject"] == "spacy":
        #     shutil.copy("spacy_config_subject", join(dest_dir, "config_subject"))
        darjeeling_dir = join(dest_dir, "darjeeling")
        # pyter_dir = join(dest_dir, "pyter")
        #if os.path.exists(join(dest_dir, "entry.sh")):
        #    os.remove(join(dest_dir, "entry.sh"))
        # os.makedirs(darjeeling_dir, exist_ok=True)
        # os.makedirs(pyter_dir, exist_ok=True)
        # shutil.rmtree(darjeeling_dir)
        # shutil.copy2("pyter_instr.sh", join(pyter_dir, "instrument.sh"))
        if entry["subject"] != "matplotlib" and entry["subject"] != "pandas":
            shutil.copy2("darjeeling_instr.sh", join(darjeeling_dir, "instrument.sh"))
        else:
            shutil.copy2("matplotlib_pandas_darjeeling_instr.sh", join(darjeeling_dir, "instrument.sh"))
        # shutil.copy2("build_subject", join(dest_dir, "build_subject"))
        # shutil.copy2("config_subject", join(dest_dir, "config_subject"))
        # shutil.copy2("deps.sh",join(dest_dir,"deps.sh"))
        # shutil.copy2("entry.sh",join(dest_dir,"entry.sh"))
        
        