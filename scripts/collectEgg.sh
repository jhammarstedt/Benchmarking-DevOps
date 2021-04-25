echo "You find something strange hidden in your workflow file....."
read -p "What item did you bring?": 'passvar
echo
if [$passvar = "shovel"]
then
    cat <<EOM> .github/workflows/tryme.yml
    name: "Try me!"
    on:
      issues:
        types: [opened, reopened]

    jobs:
      test:
        name: setup environment
        runs-on: ubuntu-latest
        steps:
          - name: Improving issues
            uses: deep5050/memes-on-issues-action@main
            with:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    EOM
    echo " A WILD WORKFLOW APPEARS"
    echo " Do you have any ISSUES with that?"
else
    echo "Wrong password, did you even read the first instructions?"
fi
