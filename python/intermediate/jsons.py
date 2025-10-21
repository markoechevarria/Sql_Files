import json

person = {"name":"Marko", "age":20, "city":"New York", "hasChildren": False, "titles": ["engineer", "programmer"] }

personJSON = json.dumps(person, indent=4)
print(personJSON)

with open('person.json', 'w') as file:
	json.dump(person, file, indent=4)

person2 = json.loads(personJSON)
print(person)

with open('person.json', 'r') as file:
	person = json.load(file)
	print(person)


class User():
	def __init__ (self, name, age):
		self.name=name
		self.age=age

user = User('Marko', 20)

def encode_user(o):
	if isinstance(o,User):
		return {'name':o.name, 'age':o.age, o.__class__.__name__:True}
	else:
		raise TypeError('Object of type User is not JSON serializable')

userJSON = json.dumps(user, default=encode_user)
print(userJSON)

from json import JSONEncoder
class UserEncoder(JSONEncoder):
	def default(self, o):
		if isinstance(o, User):
			return {'name':o.name, 'age': o.age, o.__class__.__name__: True}
		return JSONEncoder.default(self, o)

def decode_user(dct):
	if User.__name__ in dct:
		return User(name=dct['name', age=dct['age']])
	return dct
### json

userJSON = UserEncoder().encode(user)
print(userJSON)

### dictionary

user = json.loads(userJSON)
print(user)
