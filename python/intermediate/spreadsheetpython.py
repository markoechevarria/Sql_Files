import ezsheets


ss = ezsheets.Spreadsheet('1gn8HieZQlbIm62Vz_9KIBfRrZar5cJBan8DBhYOH5xY')
# print(ss.title)

# ss = ezsheets.createSpreadsheet('Title of my new spreadsheet')
# print(ss.title)

# to upload a existing excel
# ss = ezsheets.upload('my_spreadsheet.xlsx')
# ss.title

# lista = ezsheets.listSpreadsheets()
# print(lista)

ss.title = 'Class data'
print(ss.title)
print(ss.url)
print(ss.spreadsheetId)
print(ss.sheetTitles)
print(ss.sheets)
print(ss[0])
# print(ss['Students'])
# del ss[0]
# ss.sheetTitles

# ss.refresh()

"""
ss.downloadAsExcel() # Downloads the spreadsheet as an Excel file.
ss.downloadAsODS() # Downloads the spreadsheet as an OpenOffice file.
ss.downloadAsCSV() # Only downloads the first sheet as a CSV file.
ss.downloadAsTSV() # Only downloads the first sheet as a TSV file.
ss.downloadAsPDF() # Downloads the spreadsheet as a PDF.
ss.downloadAsHTML()  # Downloads the spreadsheet as a ZIP of HTML files.

ss.delete()
ss.delete(permanent = True)
"""

"""

import ezsheets
ss = ezsheets.createSpreadsheet('My Spreadsheet')
sheet = ss[0] # Get the first sheet in this spreadsheet.
sheet.title
sheet = ss[0]
sheet['A1'] = 'Name' # Set the value in cell A1.
sheet['B1'] = 'Age'
sheet['C1'] = 'Favorite Movie'
sheet['A1'] # Read the value in cell A1.
sheet['A2'] # Empty cells return a blank string.
sheet[2, 1] # Column 2, Row 1 is the same address as B1.
sheet['A2'] = 'Alice'
sheet['B2'] = 30
sheet['C2'] = 'RoboCop'

"""

# Columns and Row Addressing

"""
>>> import ezsheets
>>> ezsheets.convertAddress('A2') # Converts addresses...
(1, 2)
>>> ezsheets.convertAddress(1, 2) # ...and converts them back, too.
'A2'
>>> ezsheets.getColumnLetterOf(2)
'B'
>>> ezsheets.getColumnNumberOf('B')
2
>>> ezsheets.getColumnLetterOf(999)
'ALK'
>>> ezsheets.getColumnNumberOf('ZZZ')
18278
"""

# Reading

ss = ezsheets.upload('produceSales.xlsx')
sheet = ss[0]
print(sheet.getRow(1))
print(sheet.getRow(2))

columnOne = sheet.getColumn(1)
print(sheet.getColumn(1))

sheet.updateRow(3, ['Pumpkin', '11.50', '20','230' ])
print(sheet.getRow(3))

for i, value in enumerate( sheet.getColumn(1) ):
	columnOne[1] = value.upper()

sheet.updateColumn(1, columnOne)

# sheet.rowCount
# sheet.columnCount = 10

# ss.createSheet('Spam')
# ss.createSheet('Bacon', 0)
# ss[0].delete()
# ss[0].clear()

