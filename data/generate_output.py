import json
from bs4 import BeautifulSoup
import os

with open("output.json","r") as f:
    data = json.load(f)

# First I just want to get the new data statistics as a markdown to the index file
commit = data["commit_info"]["id"]
date = data["commit_info"]["time"]
mean = data["benchmarks"][0]["stats"]["mean"]
mini = data["benchmarks"][0]["stats"]["mean"]
maxi = data["benchmarks"][0]["stats"]["max"]
std = data["benchmarks"][0]["stats"]["stddev"]


new_data = f"""<tr>
                <td>{commit} </td>
                <td>{date}</td>
                <td>{mean}</td>
                <td>{maxi}</td>
                <td>{mini}</td>
                <td>{std}</td>
            </tr>"""


html = open('docs/index.html')
soup = BeautifulSoup(html,'html.parser')
soup.tbody.tr.append(BeautifulSoup( new_data,'html.parser'))
html.close()

new_html = soup.prettify(soup.original_encoding)
with open("docs/index.html",'w') as f:
      f.write(new_html)
      f.close()
