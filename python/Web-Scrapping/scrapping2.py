from bs4 import BeautifulSoup
import requests
import pandas as pd

header = {
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36"
}

url = "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"

response = requests.get(url, headers=header)

soup = BeautifulSoup(response.content, "html.parser")

table = soup.find(id="constituents")

header = [header.text.strip() for header in table.find_all("th") ]
print(header)

# rows = [ row.text.strip() for row in table.find_all("tr")]
# print(rows)
lista = []
for row in table.find_all('tr')[1:]:
    cells = row.find_all("td")
    row_data = [ cell.text.strip() for cell in cells ]
    lista.append(row_data)
print(lista)

df = pd.DataFrame(lista, columns=header, index=range(1,len(lista)+1))
print(df)

df.to_csv('s&p500.csv', index=False)
