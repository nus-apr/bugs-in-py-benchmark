#! /bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
benchmark_name=$(echo $script_dir | rev | cut -d "/" -f 4 | rev)
project_name=$(echo $script_dir | rev | cut -d "/" -f 3 | rev)
bug_id=$(echo $script_dir | rev | cut -d "/" -f 2 | rev)
dir_name=/experiment/$benchmark_name/$project_name/$bug_id

cd $dir_name/src
bug_info_path="$dir_name/src/bugsinpy_bug.info"
information=$(<${bug_info_path})
information="$( cut -d '"' -f 2 <<< "$information" )";
py_version=${information:0:5}
PYENV_PATH="/opt/pyenv/shims:/opt/pyenv/bin:"
sudo -E pyenv install $py_version -s
sudo -E pyenv virtualenv $py_version temp
sudo -E pyenv local temp
sudo -E pyenv rehash

# Give pyenv path higher priority && install deps
sudo -E PATH="$PYENV_PATH:$PATH" /opt/pyenv/versions/temp/bin/python -m pip install --upgrade pip
sudo -E PATH="$PYENV_PATH:$PATH" bash /setup/$benchmark_name/$project_name/$bug_id/build_subject
sudo -E PATH="$PYENV_PATH:$PATH" /opt/pyenv/versions/temp/bin/python -m pip install coverage pytest
# Remove any extra pytest init
rm -rf pytest.ini