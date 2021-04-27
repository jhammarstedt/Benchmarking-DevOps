#!/bin/bash
echo "You spot something strange burried in your workflow directory....."
echo "What item did you bring?: "
read item

FILE="github/workflows/tryme.yml"
if [ -f $FILE ]; then
    rm $FILE
fi

if [[ "$item" == "shovel" ]]; then
cat <<EOM> .github/workflows/tryme.yml

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
          GITHUB_TOKEN: \${{ secrets.GITHUB_TOKEN }}
          issue_msg: "🎉 Hi, {{author}}, congrats on finding the hidden workflow🎉 
          
	  We shall reward you with the ability to get memes on your issues!🥚✨
          {{meme}}
	  " 
          allow_owner: true # get meme on your own issue :)
EOM

rm output.json
touch output.json

git add .
git commit -m 'Added wild workflow'
git push

echo "A WILD WORKFLOW APPEARS"
echo "Do you have any (open) ISSUES with that?"
else
	echo "Wrong password, did you even read the first instructions? (if not, look at the hint in the end)"
fi
