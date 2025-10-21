mydict = {
	"name": "marko",
	"age": 20,
	"city": "lima"
}

mydict2 = dict(name="marko", age=20, city="lima")

print(mydict)
print(mydict2)
print(mydict2["name"])

mydict2["email"] = "marko@gmail.com"
print(mydict2)

del mydict2["email"]
# mydict.pop("email")
print(mydict2)

mydict2.popitem()
print(mydict2)

for key in mydict2: # the same with value
	print(key)

for key, value in mydict2.items():
	print(key, " -> ", value)

dicty = {"name": "marko", "age":20, "city": "lima"}
print(dicty.get("name", 0))
print(dicty.get("amount", 0))

dicty.setdefault("curso","python")
dicty.setdefault("age",30)
print(dicty)

# dict_copy = mydict.copy()
# dict_copy = dict(mydict)

# my_dict.update(my_dict2) <- merge two dicts

import pprint
print("Output cleaner:")
pprint.pprint(dicty)
