import requests
from lxml import html

header = {
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"
}
url = "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"

response = requests.get(url, headers=header)
response.encoding = "utf-8"

parseo = html.fromstring(response.content)

target = parseo.xpath("//table[@id='constituents']/tbody/tr/td/a[contains (@class,'external')]/text()")
print(target)



### transfermarket scrapping

header = { "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36" }  
url = "https://www.transfermarkt.com/laliga/gesamtspielplan/wettbewerb/ES1/saison_id/2025"

response = requests.get(url, headers=header)
response.encoding = "utf-8"
parseo = html.fromstring(response.content)
print(parseo.text_content())

matchdays = parseo.xpath("/main[@id='tm-main']/div[@class='row']/div[@class='row']/div[contains (@class, 'columns')]/div[@class='columns']/div[@class='box']/table/tbody/tr[not(@class,'bg_blau_20')]/text()")
print(matchdays)
