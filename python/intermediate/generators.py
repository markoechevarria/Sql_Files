def mygenerator():
	yield 1
	yield 2
	yield 3

g = mygenerator()
print(sum(g))

g = mygenerator()
value = next(g)
value = next(g)
value = next(g)

print(value)
g = mygenerator()

for _ in g:
	print(_)

# sorted(g) -> sorted the list

def countdown(num):
	print("Starting")
	while num > 0:
		yield num
		num -= 1
cd = countdown(5)

value = next(cd)
print(value)

print(next(cd))
print(next(cd))
print(next(cd))
print(next(cd))

import sys

def firstn(n):
	nums = []
	num = 0
	while num < n:
		nums.append(num)
		num += 1
	return nums

def firstn_generator(n):
	num = 0
	while num < n:
		yield num
		num += 1

print(sys.getsizeof(firstn(10000)))
print(sys.getsizeof(firstn_generator(10000)))


def fibonacci(limit):
	a, b = 0, 1
	while a < limit:
		yield a
		a, b = b, a+b

fib = fibonacci(30)
for i in fib:
	print(i)


import sys

myGenerator = (i for i in range(100000) if i%2 ==0)
myList = [i for i in range(100000) if i%2 == 0]

print(sys.getsizeof(myGenerator))
print(sys.getsizeof(myList))
