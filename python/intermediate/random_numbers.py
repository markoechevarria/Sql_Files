import random

a = random.random()
print(a)

b = random.uniform(1, 10)
c = random.randint(1, 10) # include upper limit
d = random.randrange(1, 10) # not include upper limit

a = random.normalvariate(0, 1)
print(a)

myList = list("ABCDEFGH")
a = random.choice(myList)
print(a)

a = random.sample(myList, 2)    # 2 values of the list
a = random.choices(myList, k=2)  # 2 values of the list, repetition allowed 
random.shuffle(myList)
print(a)
print(myList)

random.seed(1) # use a seed for the random numbers

import secrets

a = secrets.randbits(2)
print(a)

myList = list("ABCDEFGH")
a = secrets.choice(myList)
print(a)

### numpy

import numpy as np

a = np.random.rand(2,2)
print(a)

a = np.random.randint(0, 10,(2,3))
print(a)

arr = np.array([[1,2,3], [4,5,6], [7,8,9]])
print(arr)

np.random.shuffle(arr)
print(arr)

np.random.seed(1)
