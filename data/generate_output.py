import json
import markdown

with open("output.json","r") as f:
    data = json.load(f)

# First I just want to get the new data statistics as a markdown to the index file
commit = data["commit_info"]["id"]
date = data["commit_info"]["time"]
mean = data["benchmarks"][0]["stats"]["mean"]
mini = data["benchmarks"][0]["stats"]["mean"]
maxi = data["benchmarks"][0]["stats"]["max"]
std = data["benchmarks"][0]["stats"]["stddev"]
#print(data["benchmarks"]['stats'])
output = markdown.markdown(f'''
# This is the latest statistics from {date}
| Commit    | Mean  | Stddev|
|----       |----   |----   |
| {commit}  |{mean} |{std}  |

''')
print(output)
with open('docs/index.md','w') as f:
    f.write(output)
    f.close