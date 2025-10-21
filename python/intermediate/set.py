myset = {1,2,3,1,2}
myset = set([1,2,3,1,2])

myset.add(10)
# myset.remove(2)
# myset.discard(4)

print(myset.pop())

print(myset)

odds = {1,3,5,7}
evens = {2,4,6,8}
primes = {2,3,5,7}

u = odds.union(evens)
print(u)

i = evens.intersection(primes)
print(i)

d = odds.difference(primes)
print(d)

sd = odds.symmetric_difference(primes)
print(sd)

# setA.update(setB)
# setA.intersection_update(setB)
# setA.difference_update(setB)
# setA.symmetric_difference_update(setB)
# setA.issubset(setB)
# setA.isdisjoint(setB)

# new_set = old_set.copy()

# a = frozenset([1,2,3,4,5])

