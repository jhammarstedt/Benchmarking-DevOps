import json
from bs4 import BeautifulSoup
import os


"""
This file will read the latest output file generated by the workflow and take out relevant statistics.
As this tutorial is more to show of the workflow and how to set up a github action than building websites,
we'll be simply inserting the new data in the index.html file instead of having a js file that would read the json file.
which requires some more integration.

"""

with open("output.json","r") as f: 
    data = json.load(f)

# First we get the new data statistics as a markdown to the index file
commit = data["commit_info"]["id"]
date = data["commit_info"]["time"]
mean_t = round(data["benchmarks"][0]["stats"]["mean"],4)
mean_c = round(data["benchmarks"][1]["stats"]["mean"],4)


std_t = round(data["benchmarks"][0]["stats"]["stddev"],4)
std_c = round(data["benchmarks"][1]["stats"]["stddev"],4)

#getting some comparissions
diff_mean = mean_c-mean_t 
diff_std = std_c-std_t


# The format of the index.html is to place new entires in <tr> = <tablerow> which will be inside a tableBody
new_data = f"""<tr>
                <td>{commit} </td>
                <td>{date}</td>
                <td>{mean_t}</td>
                <td>{mean_c}</td>
                <td>{diff_mean}</td>
                <td>{std_t}</td>
                <td>{std_c}</td>
                <td>{diff_std}</td>
            </tr>"""

# Using bs4 we can now just insert the new data to the table, maybe not best practice but it works :)
html = open('docs/index.html')
soup = BeautifulSoup(html,'html.parser')
soup.tbody.tr.append(BeautifulSoup( new_data,'html.parser'))
html.close()

new_html = soup.prettify(soup.original_encoding)
with open("docs/index.html",'w') as f:
      f.write(new_html)
      f.close()
