import requests
from bs4 import BeautifulSoup
import pandas as pd

header = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36",
}

### First page

url = "https://thehackernews.com/"

response = requests.get(url, headers=header)

soup = BeautifulSoup(response.content, "html.parser")
table = soup.find(class_="blog-posts")

news = []
for new in table.find_all(class_="body-post"):
    title = new.find(class_="home-title")
    description = new.find(class_="home-desc")
    news.append([title.text.strip(),description.text.strip()])   

df = pd.DataFrame(news, columns=["Title","Description"])
print(df)

### Second page

url = "https://news.ycombinator.com/"
response = requests.get(url, headers=header)
soup = BeautifulSoup(response.content, "html.parser")

table = soup.find(id="bigbox")
table = table.find("table")

new_list = []
# 0 1   3 4     6 7 
news = table.find_all("tr")

auxiliar=[]
for i in range(len(news)):
    if i%3==0:
        texto = news[i].find(class_="titleline")
        print("\n\n\n", texto, "\n\n\n\n")
        auxiliar.append(texto)
    if i%3==1:
        texto = news[i].find(class_="subline")
        auxiliar.append(texto)
        new_list.append(auxiliar)
        auxiliar = []

print(new_list)
