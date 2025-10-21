# lambda arguments: expression

add10 = lambda x: x + 10
print(add10(5))

mult = lambda x,y: x*y
print(mult(10, 15))

points = [(1,2), (14, 10), (8, 1), (10, 4)]

pointed_sorted = sorted(points, key=lambda x: x[0] - x[1])
print(pointed_sorted)

# map(func, seq)

a = [1,2,3,4,5]
b = map(lambda x: x*2, a)
print(list(b))

c = [x*2 for x in a]
print(c)

# filter(func, seq)

a = [1,2,3,4,5,6,7]
b = map(lambda x: x%2==0, a)
print(list(b))

# reduce(func, seq)

from functools import reduce

a = [1,2,3,4,5,6]
product_a = reduce(lambda x,y: x*y, a)
print(product_a)
