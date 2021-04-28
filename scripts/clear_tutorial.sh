#!/bin/bash
# ONLY FOR THE KATACODA TUTORIAL
# Ignore otherwise

# Cleaning out the repo for the tutorial
echo "Removing files for tutorial"
rm -rf .github
cd src
find . ! -name 'generate_output.py' -type f -exec rm -f {} +
cd ..
rm output.json 
rm README.md

# cleaning the index file from previous runs
./scripts/clear_table.sh

# Creating a new clean readme
cat <<EOM> README.md
# Continious Benchmarking with Github Actions
This is a katacoda tutorial template to test github actions.
Created by [jhammarstedt](https://github.com/jhammarstedt) and [carllei](https://github.com/carllei)
EOM
echo "Necessary files are removed"
