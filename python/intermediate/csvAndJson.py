import csv
exampleFile = open('example.csv')
exampleReader = csv.reader(exampleFile)
exampleData = list(exampleReader)
# print(exampleData)

### Reading DAta from reader Objects in a for Loop

for row in exampleData:
	print('Row ' + str(exampleReader.line_num) +' '+ str(row))

### Writer Objects

outputFile = open('output.csv', 'w', newline='')
outputWriter = csv.writer(outputFile)
outputWriter.writerow(['spam', 'eggs', 'bacon'])

outputWriter.writerow(['hello world', 'eggs', 'bacon', 'ham'])
outputWriter.writerow([1,2,3.141592, 4])

### The delimiter and lineterminator Keyword Arguments

csvFile = open('example.csv', 'w', newline='')
csvWriter = csv.writer(csvFile, delimiter='\t', lineterminator='\n\n')
csvWriter.writerow(['apples', 'oranges', 'grapes'])
csvFile.close()

### DictReader and DictWriter CSV Objects

exampleFile = open('exampleWithHeader.csv')
exampleDictReader = csv.DictReader(exampleFile)
for row in exampleDictReader:
	print(row['Timestamp'], row['Fruit'], row['Quantity'] )

exampleFile = open('example.csv')
exampleDictReader = csv.DictReader(exampleFile, ['time', 'name', 'amount'])
for row in exampleDictReader:
	print(row['time'], row['name'], row['amount'])

outputFile = open('output.csv', 'w', newline='')
outputDictWriter = csv.DictWriter(outputFile, ['Name', 'Pet', 'Phone'])
outputDictWriter.writeheader()
outputDictWriter.writerow({'Name':'Alice', 'Pet':'Cat', 'Phone':'5555-1234'})
outputFile.close()

### Project: Removing the Header from CSV Files

import csv, os
os.makedirs('headerRemoved', exist_ok=True)
for csvFilename in os.listdir('.'):
	if not csvFilename.endswith('.csv'):
		continue
	print('REmoving header from ' + csvFilename + '...')

	csvRows = []
	csvFileObj = open(csvFilename)
	readerObj = csv.reader(csvFileObj)
	for row in readerObj:
		if readerObj.line_num == 1:
			continue    # skip first row
	csvRows.append(row)
	csvFileObj.close()

	csvFileObj = open(os.path.join('headerRemoved', csvFilename), 'w', newline='')
	csvWriter = csv.writer(csvFileObj)
	for row in csvRows:
		csvWriter.writerow(row)
	csvFileObj.close()

### JSONA and APIs

stringOfJsonData = '{"name": "Zophie", "isCat": true, "miceCaught": 0, "felineIQ": null}'
import json
jsonDataAsPythonValue = json.loads(stringOfJsonData)
print(jsonDataAsPythonValue)

pythonValue = {'isCat': True, 'miceCaught': 0, 'name':'Zophie', 'felineIQ': None}
import json
stringOfJsonData = json.dumps(pythonValue)
print(stringOfJsonData)

### Get Location fro the command line argument

import json, requests, sys
if len(sys.argv) < 2:
	print('Usage: getOpenWeather.py city_name, 2-letter_country_code')
	sys.exit()
location = ' '.join(sys.argv[1:])

city_name = sys.argv[1]
country_code = sys.argv[2]

url = f"https://api.openweathermap.org/data/2.5/weather?q={city_name},{country_code}&appid={APPID}"
response = requests.get(url)
response.raise_for_status()

print(response.text)

weatherData = json.loads(response.text)

w = weatherData
print('Current weather in %s:' % (location))
print(w['weather'][0]['main'], '-', w['weather'][0]['description'])
print()
print('Tomorrow:')
print(w['weather'][0]['main'], '-', w['weather'][0]['description'])
print()
print('Day after tomorrow:')
print(w['weather'][0]['main'], '-', w['weather'][0]['description'])
