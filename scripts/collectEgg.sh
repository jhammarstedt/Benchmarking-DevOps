#!/bin/bash
echo "You find something strange hidden in your workflow file....."
echo "What item did you bring?: "
read item
shift 2

if [[ "$item" == "shovel" ]]; then
cat <<EOM>> .github/workflows/tryme.yml
name: "Greet With A Random Meme"
on:
  issues:
    types: [opened, reopened]

jobs:
  test:
    name: setup environment
    runs-on: ubuntu-latest
    steps:
      - name: memes on isssues
        uses: deep5050/memes-on-issues-action@main
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
 
EOM
echo "A WILD WORKFLOW APPEARS"
echo "Do you have any ISSUES with that?"
else
	echo "Wrong password, did you even read the first instructions?"
fi
