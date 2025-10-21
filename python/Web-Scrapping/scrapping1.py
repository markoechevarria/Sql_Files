import requests
from lxml import html

header = {
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"
}

url = "https://www.wikipedia.org/"

respuesta = requests.get(url, headers=header)
respuesta.encoding = "utf-8"

parseo = html.fromstring(respuesta.content)
target = parseo.get_element_by_id("js-link-box-ru")
ingles = parseo.xpath("//a[@id='js-link-box-ru']/strong/text()")

# print(target.text_content())
# print(ingles)

tags = parseo.find_class("central-featured-lang")
lista = []

for tag in tags:
    for i in tag.iter("strong"):
        lista.append(i.text)

print(lista)

idiomas = parseo.xpath("//div[contains (@class, 'central-featured-lang')]//strong/text()")
print(idiomas)
