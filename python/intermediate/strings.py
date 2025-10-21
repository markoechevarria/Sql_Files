string1 = "this is a string"
string2 = """
	this a string
 """

char = string1[-1]
char = string1[-2]

substring = string1[::-1]
print(substring)

string3 = string1.strip() # delete spaces || rstrip() and lstrip()
# .upper() and  .lower()
# string.starswith("this")
# string.endswith("this")
# stirng.find("this")
# string.count("o")
# string.replace("old", "new", times)

# my_list = my_string.split(" ")
# my_string = " ".join(my_list)

# isalpha(), isalnum(), isdecimal(), isspace(), istitle()

# "hello world".partition("w")
# (hello, w, orld)

var = 10
var2 = 0.15
string4 = "this is %d" %var # %d %s %f
print(string4)

string4 = "this is {:.2f} and {}".format(var, var2)
print(string4)

string5 = f"this is s {var}"
print(string5)

# "hello".rjust(10)
# "hello".ljust(10)
# "hello".rjust(10, '*')
# "hello".ljust(10, '*')
# "hello".center() || "hello".center(10, '=')
