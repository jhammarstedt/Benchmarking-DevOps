#!/bin/bash
# ONLY FOR THE KATACODA TUTORIAL
# Ignore otherwise

# Cleaning out the repo for the tutorial
echo "Removing files for tutorial"
rm -rf .github src 
rm output.json 
rm README.md

cat <<EOM> README.md
# ghActions tutorial in katacoda
This is a katacoda tutorial template to test github actions.
Created by @jhammarstedt and @carllei

echo "Necessary files are removed"
