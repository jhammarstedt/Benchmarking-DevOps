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
name: Memer Workflow

on: issues

jobs:
  greeting:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Run Memer Action
        id: memer

        uses: Bhupesh-V/memer-action@master
        with:
          filter: "new"

      - name: Check Outputs
        run: |
          echo "\${{ steps.memer.outputs.meme }}"
          echo "\${{ steps.memer.outputs.title }}"
          echo "\${{ steps.memer.outputs.source }}"
      - name: Create comment
        uses: peter-evans/create-or-update-comment@v1.3.0
        id: couc
        with:
          issue-number: \${{ github.event.issue.number }}
          body: |
            🎉You found the hidden workflow!!🎉
            You will now get the reddit memes on your issues!🥚
            (New one is generetad every few minutes)
            
            
            > **\${{ steps.memer.outputs.title }}**
            ![meme](\${{ steps.memer.outputs.meme }})
            <sub>ℹ️ <a href="\${{ steps.memer.outputs.source }}">Source</a> [ Powered By 🔥 <a href="https://github.com/Bhupesh-V/memer-action">Memer Action</a> ]</sub>
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
