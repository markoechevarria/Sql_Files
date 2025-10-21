from itertools import product
from itertools import permutations
from itertools import combinations
from itertools import combinations_with_replacement
from itertools import accumulate
from itertools import groupby
import operator
from itertools import count, cycle, repeat

a = [1,2]
b = [3,4]

print(list(product(a,b)))
print(list(product(a,b, repeat=2)))

a = [1,2,3]
print(list(permutations(a)))
print(list(permutations(a, 2)))

a = [1,2,3,4]
print(list(combinations(a,2)))

print(list(combinations_with_replacement(a,2)))

print(list(accumulate(a)))
print(list(accumulate(a, func=operator.mul)))
print(list(accumulate(a, func=max)))

def smallerThan3(x):
	return x<3

group_obj = groupby(a, key= lambda x: x<3)
for key, value in group_obj:
	print(key, list(value))
persons = [{"nombre": "marko", "edad":20}, {"nombre": "juan", "edad": 20}, {"nombre": "percy", "edad": 22}, {"nombre":"joaquin", "edad": 25}]
group_persons = groupby(persons, key = lambda x: x["edad"])
for key, value in group_persons:
	print(key, list(value))

for i in count(10):
	print(i)
	if i == 15:
		break

#for i in cycle(a):
#	print(a)

for i in repeat(1, 10):
	print(i)
