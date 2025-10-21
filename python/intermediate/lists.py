mylists = [1,2,3,4,5,6]
mylists2 = list()

print(mylists)
print(mylists2)
print(mylists[2])
print(mylists[-1])

for x in mylists:
	print(x)

# len(mylists)

mylists.append(10)
print(mylists)

mylists.insert(2, 10)
print(mylists)

item_dropped = mylists.pop()
print(item_dropped)
print(mylists)

# list.remove("element")
# list.clear()   <- clear the list
# list.reverse()
# list.sort() <- modifiy the list
# new_list = sorted(list) <- create a new sorted list

# new_list = list1 + list2
# new_list = list[start:end:step]

# list1 = list2 <- both pointer the same memory address
# list_copy = list.copy() <- copy the list at another list
# list_copy = list(list)  <- also copy
# list_copy = list[:] 	  <- also copy



