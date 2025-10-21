import re

phoneRegex = re.compile(r'\d{3}-\d{3}-\d{4}')
# phoneRegex = re.compile(r'(\d{3})-(\d{3})-(\d{4})')
# phoneRegex = re.compile(r'\(\d{3}))    # escape especial characters

mo = phoneRegex.search("My number is 111-222-3333. ")
print("Phone number found: " + mo.group())

heroRegex = re.compile(r'Batman|Tina Fey')
mo1 = heroRegex.search('Batman and Tina Fey')
print(mo1.group())

mo2 = heroRegex.search('Tina Fey and Batman')
print(mo2.group())

batRegex = re.compile(r'Bat(man|mobile|copter|bat)')
mo3 = batRegex.search('Batmobile last a wheeel')
print(mo3.group())

batRegex2 = re.compile(r'Bat(wo)?man')
mo4 = batRegex2.search('The adventures of Batman')
mo5 = batRegex2.search('The adventures of Batwoman')
print(mo4.group())
print(mo5.group())

phoneRegex = re.compile(r'(\d\d\d-)?\d\d\d-\d\d\d\d')
mo1 = phoneRegex.search('My number is 415-555-4242')
mo2 = phoneRegex.search('My number is 555-4242')
print(mo1.group())
print(mo2.group())

batRegex = re.compile(r'Bat(wo)*man')
mo1 = batRegex.search('The Adventures of Batwowowowoman')
print(mo1.group())

batRegex = re.compile(r'Bat(wo)+man')
mo1 = batRegex.search('The Adventures of Batwowowowoman')
print(mo1.group())
mo2 = batRegex.search('The Adventures of Batman')
print(mo2 == None)

haRegex = re.compile(r'(Ha){3}') # {min, max}
mo1 = haRegex.search('HaHaHa')
mo2 = haRegex.search('Ha')
print( mo1.group() )
print( mo2 == None )

greedyHaRegex = re.compile(r'(Ha){3,5}')
mo1 = greedyHaRegex.search('HaHaHaHaHa')
print(mo1.group())

nongreedyHaRegex = re.compile(r'(Ha){3,5}?')
mo2 = nongreedyHaRegex.search('HaHaHaHaHa')
print(mo2.group())

phoneNumRegex = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d')
mo1 = phoneNumRegex.findall('Cell: 415-555-9999 Work: 212-555-0000')
print(mo1)

"""
	Character classes
	\d -> any digit from 0 to 9
	\D -> any character that is not a numeric digit from 0 to 9
	\w -> any letter, numeric digit, or the underscore character
	\W -> any character that is not letter, numeric or underscore
	\s -> any space, tab, or neline character
	\S -> any character that is not a space, tab, or newline
"""

xmasRegex = re.compile(r'\d+\s\w+')
mo1 = xmasRegex.findall('12 drummers, 11 pipers, 10 lords, 9 ladies, 5 swans, 6 geese, 5 rings, 4 birds, 3 hens, 2 doves, 1 partridge')
print(mo1)

vowelRegex = re.compile(r'[aeiouAEIOU]')
mo1 = vowelRegex.findall('RoboCop eats baby food. BABY FOOD.')
print(mo1)

consonantRegex = re.compile(r'[^aeiouAEIOU]')
mo1 = consonantRegex.findall('RoboCop eats baby food. BABY FOOD.')
print(mo1)

beginsWithHello = re.compile(r'^Hello')
mo1 = beginsWithHello.search('Hello, world!')
print(mo1)
print( beginsWithHello.search('He said hello.') == None )

endsWithNumber = re.compile(r'\d$')
mo1 = endsWithNumber.search('Your number is 42')
print(mo1)
print( endsWithNumber.search('Your number is forty two.') == None)

wholeStringIsNum = re.compile(r'^\d+$')
mo1 = wholeStringIsNum.search('1234567890')
print(mo1)
print( wholeStringIsNum.search('12345xyz67890') == None)
print( wholeStringIsNum.search('12  34567890') == None)


atRegex = re.compile(r'.at')
mo1 = atRegex.findall("The cat in the hat sat on the flat mat")
print(mo1)


nameRegex = re.compile(r'First Name: (.*) Last Name: (.*)')
mo = nameRegex.search('First Name: Al Last Name: Sweigart')
print( mo )

newlineRegex = re.compile('.*', re.DOTALL)
mo1 = newlineRegex.search('Serve the public trust.\nProtect the innocent.\nUphold the law.').group()
print(mo1)

"""
The ? matches zero or one of the preceding group.
The * matches zero or more of the preceding group.
The + matches one or more of the preceding group.
The {n} matches exactly n of the preceding group.
The {n,} matches n or more of the preceding group.
The {,m} matches 0 to m of the preceding group.
The {n,m} matches at least n and at most m of the preceding group.
{n,m}? or *? or +? performs a non-greedy match of the preceding group.
^spam means the string must begin with spam.
spam$ means the string must end with spam.
The . matches any character, except newline characters.
\d, \w, and \s match a digit, word, or space character, respectively.
\D, \W, and \S match anything except a digit, word, or space character, respectively.
[abc] matches any character between the brackets (such as a, b, or c).
[^abc] matches any character that isn’t between the brackets.
"""

robocop = re.compile(r'robocop', re.I)
mo1 = robocop.search("RoboCop is part man, part machine, all cop.").group()
print(mo1)


namesRegex = re.compile(r'Agent \w+')
mo1 = namesRegex.sub('CENSORED', 'Agent Alice gave the secret document to Agent Bob.')
print(mo1)


agentNamesRegex = re.compile(r'Agent (\w)\w*')
mo1 = agentNamesRegex.sub(r'\1****', 'Agent Alice told Agent Carol that Agent Eve knew Agent Bob was a double agent.')
print(mo1)


phoneRegex = re.compile(r'''(
    (\d{3}|\(\d{3}\))?            # area code
    (\s|-|\.)?                    # separator
    \d{3}                         # first 3 digits
    (\s|-|\.)                     # separator
    \d{4}                         # last 4 digits
    (\s*(ext|x|ext.)\s*\d{2,5})?  # extension
    )''', re.VERBOSE)

someRegexValue = re.compile('foo', re.IGNORECASE | re.DOTALL | re.VERBOSE)
