# tuple is inmutable
mytuple = (1,2,3,4)
mytuple = tuple([1,2,3,4])

item = mytuple[0]
len(mytuple)
print(mytuple.count(1))
print(mytuple.index(2))

mylist = list(mytuple)
mytuple = tuple(mylist)


i1, *i2, i3 = mytuple
print(i1, i2, i3)
