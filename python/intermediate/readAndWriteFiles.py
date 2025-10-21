from pathlib import Path

print(Path('spam', 'bacon', 'eggs'))  # spam/bacon/eggs

myFiles = ['accounts.txt', 'details.csv', 'invite.docx']
for filename in myFiles:
	print(Path(r'C:/Users/Al', filename))

print(Path('Spam') / 'bacon' / 'eggs')

print(Path.cwd())
print(Path.home())

import os

# os.makedirs('/home/markodeb/Documents/python/intermediate/pruebapaga')

Path.cwd().is_absolute()

os.path.abspath('.')
os.path.abspath('.\\Scripts')
os.path.isabs('.')
os.path.isabs(os.path.abspath('.'))

p = Path('C:/Users/Al/spam.txt')
p.anchor
p.parent
p.name
p.stem
p.suffix
p.drive

p = Path.cwd()
print(p.parents[0])
print(p.parents[1])
print(p.parents[2])
print(p.parents[3])
print(p.parents[4])


calcFilePath = '/home/markodeb/Documents/python/intermediate/a.txt'
print(os.path.basename(calcFilePath))
print(os.path.dirname(calcFilePath))
print(os.path.split(calcFilePath))

print( os.listdir('/home/markodeb/Documents/python/intermediate') )
print( os.path.getsize('/home/markodeb/Documents/python/intermediate/collect.py') )

p = Path('/home/markodeb/Documents/python/intermediate')
print(p.glob('*'))

print(list(p.glob('*')))
print(list(p.glob('*.txt')))
list(p.glob('project?.docx'))

"""
	.exists()
	.id_dir()
	.exists()
	.is_file()
	.is_dir()
"""

p = Path('spam.txt')
p.write_text('Hello, world')
print(p.read_text())

helloFile = open(Path.cwd() / 'hello.txt' )
helloContent = helloFile.read() # .readlines()
print(helloContent)

"""
>>> baconFile = open('bacon.txt', 'w')
>>> baconFile.write('Hello, world!\n')
13
>>> baconFile.close()
>>> baconFile = open('bacon.txt', 'a')
>>> baconFile.write('Bacon is not a vegetable.')
25
>>> baconFile.close()
>>> baconFile = open('bacon.txt')
>>> content = baconFile.read()
>>> baconFile.close()
>>> print(content)
"""

