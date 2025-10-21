#! python3
# mapIt.py - Launches a map in the browser using an address from the
# command line or clipboard.
import webbrowser, sys, pyperclip
if len(sys.argv) > 1:
	# Get address from command line.
	address = ' '.join(sys.argv[1:])
else:
	# Get address from clipboard.
	address = pyperclip.paste()

webbrowser.open('https://www.google.com/maps/place/' + address)


import requests
res = requests.get('https://automatetheboringstuff.com/files/rj.txt')
type(res)
res.status_code == requests.codes.ok
len(res.text)
print(res.text[:250])


# res = requests.get('https://inventwithpython.com/page_that_does_not_exist')
# res.raise_for_status()


res = requests.get('https://automatetheboringstuff.com/files/rj.txt')
res.raise_for_status()
playFile = open('RomeoAndJuliet.txt', 'wb')
for chunk in res.iter_content(100000):
	playFile.write(chunk)
playFile.close()


import bs4, requests

res = requests.get('http://nostarch.com')
print(res.raise_for_status)
noStarchSoup = bs4.BeautifulSoup(res.text, 'html.parser')
print(type(noStarchSoup))


exampleFile = open('example.html')
exampleSoup = bs4.BeautifulSoup(exampleFile.read(), 'html.parser')
elems = exampleSoup.select('#author')
print(type(elems))
print(len(elems))
print(type(elems[0]))
print(str(elems[0]))
print(elems[0].getText())
print(elems[0].attrs)


pElems = exampleSoup.select('p')
print(str(pElems[0]))
print(pElems[0].getText())
print(str(pElems[1]))
print(pElems[1].getText())
print(str(pElems[2]))
print(pElems[2].getText())


soup = bs4.BeautifulSoup(open('example.html'), 'html.parser')
spanElem = soup.select('span')[0]
print(str(spanElem))
print(spanElem.get('id'))
print(spanElem.get('some_nonexistent_addr') == None)
print(spanElem.attrs)
