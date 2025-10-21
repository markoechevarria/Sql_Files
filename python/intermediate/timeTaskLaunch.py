### Time module

import time
import sys

def calcProd():
	product = 1
	for i in range(1, 100000): product = product * i
	return product
startTime = time.time()
prod = calcProd()
endTime = time.time()

sys.set_int_max_str_digits(0)

print('The result is %s digits long.' % (len( str(prod) )) )
print('Took %s seconds to calculate.' % (endTime - startTime))


### .ctime()

print(time.ctime())
thisMoment = time.time()
print(time.ctime(thisMoment))

### time.sleep()

for i in range(3):
	print('Tick')
	time.sleep(0.1)
	print('Tock')
	time.sleep(0.1)
time.sleep(0.2)

### Rounding numbers

number = 12345.5712374590127304
print( round(number) )
print( round(number, 3) )

### Datetime Module

import datetime
print(datetime.datetime.now())
dt = datetime.datetime(2019, 10, 21, 16, 29, 0)
print(dt.year, dt.month, dt.day)
print(dt.hour, dt.minute, dt.second)

d1 = datetime.datetime.fromtimestamp(1000000)
d2 = datetime.datetime.fromtimestamp(time.time())
print(d1)
print(d2)

halloween2024 = datetime.datetime(2024, 10, 31, 0, 0 , 0)
newyears2024 = datetime.datetime(2024, 1, 1, 0, 0 , 0)
oct31halloween2024 = datetime.datetime(2024,10,31, 0,0,0)

print(halloween2024 == oct31halloween2024)
print(halloween2024 > newyears2024)

delta = datetime.timedelta(days=11, hours=10, minutes=9,seconds=8)
print(delta.days, delta.seconds, delta.microseconds)

print(delta.total_seconds())
print(str(delta))

dt = datetime.datetime.now()
print(dt)
thousandDays = datetime.timedelta(days = 1000)
print(dt + thousandDays)



oct21st = datetime.datetime(2019, 10, 21, 16, 29, 0)
aboutThirtyYears = datetime.timedelta(days=365 * 30)
print( oct21st )
print( oct21st - aboutThirtyYears )
print( oct21st - (2 * aboutThirtyYears))

"""
Pausing until a specific date

import datetime
import time
halloween2024 = datetime.datetime(2024,10,31,0,0,0)
while datetime.datetime.now() < halloween2024:
	time.sleep(1)
"""

### Converting datetime Objects into Strings

"""
%Y	Year with century, as in '2014'
%y	Year without century, '00' to '99' (1970 to 2069)
%m	Month as a decimal number, '01' to '12'
%B	Full month name, as in 'November'
%b	Abbreviated month name, as in 'Nov'
%d	Day of the month, '01' to '31'
%j	Day of the year, '001' to '366'
%w	Day of the week, '0' (Sunday) to '6' (Saturday)
%A	Full weekday name, as in 'Monday'
%a	Abbreviated weekday name, as in 'Mon'
%H	Hour (24-hour clock), '00' to '23'
%I	Hour (12-hour clock), '01' to '12'
%M	Minute, '00' to '59'
%S	Second, '00' to '59'
%p	'AM' or 'PM'
%%	Literal '%' character
"""

oct21st = datetime.datetime(2024, 10, 21, 16, 29, 0)
print( oct21st.strftime('%Y/%m/%d %H:%M:%S') )
print( oct21st.strftime('%I:%M %p') )
print( oct21st.strftime('%B of %y') )

### Converting strings into datetime objects

print( datetime.datetime.strptime('October 21, 2019', '%B %d, %Y') )
print( datetime.datetime.strptime('2019/10/21 16:29:00', '%Y/%m/%d %H:%M:%S') )
print( datetime.datetime.strptime("October of '19", "%B of '%y") )
print( datetime.datetime.strptime("November of '63", "%B of '%y") )

### Multithreading


