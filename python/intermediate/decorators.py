def my_decorator(func):

	def wrapper(*args, **kwargs):
		print("start")
		result = func(*args, **kwargs)
		print("end")
		return result
	return wrapper
@my_decorator
def add5(x):
	return x + 5

print(add5(3))


def repeat(num_items):
	def decorator_repeat(func):
		def wrapper(*args, **kwargs):
			for _ in range(num_items):
				result = func(*args, **kwargs)
			return result
		return wrapper
	return decorator_repeat

@repeat(num_items=3)
def greet(name):
	print(f"Hello {name}")

greet("Marko")


class CountCalls:
	def __init__(self, func):
		self.func = func
		self.num_calls = 0

	def __call__(self, *args, **kwargs):
		self.num_calls += 1
		print(f'This is executed {self.num_calls} times.')
		return self.func(*args, **kwargs)

@CountCalls
def say_hello():
	print("Hello")

say_hello()
say_hello()
