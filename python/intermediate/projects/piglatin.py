#! python3
# Pig Latin silly made-up language

print("Insert the English message to translate into Pig Latin")
message = input()

# message = "fidel es un mongo y pepi ademas"

words = message.split(" ")
new_message = []
print(words)

for word in words:
	list_vowel = ['a','e','i','o','u']
	list_vowel_upper = ['A','E','I','O','U']
	if (len(word)>2):
		if (word[0].isalpha()):
			if word[0].isupper():
				if word[0] in list_vowel_upper:
					if ( word[1].isupper() ):
						new_word = word[:] + 'YAY'
					else:
						new_word = word[:] + 'yay'
				else:
					if ( word[1] not in list_vowel_upper ):
						if word[1].isupper():
							new_word = word[2:] + word[:3] + 'AY'
						else:
							new_word = word[2].upper() + word[3:] + word[:2] + 'ay'
					else:
						if word[1].isupper():
							new_word = word[1:] + word[0] + 'AY'
						else:
							new_word = word[1].upper() + word[2:] + word[0].lower() + 'ay'
			else:
				if word[0] in list_vowel:
					new_word = word[:] + 'yay'
				else:
					if word[1] not in list_vowel:
						new_word = word[2:] + word[:2] + 'ay'
					else:
						new_word = word[1:] + word[0] + 'ay'
		else:
			new_word = word
	elif (len(word) == 2):
		if (word[0].isalpha()):
			if word[0].isupper():
				if word[0] in list_vowel_upper:
					if ( word[1].isupper() ):
						new_word = word[:] + 'YAY'
					else:
						new_word = word[:] + 'yay'
				else:
					if word[1].isupper():
						new_word = word[1:] + word[0] + 'AY'
					else:
						new_word = word[1].upper() + word[2:] + word[0].lower() + 'ay'
			else:
				if word[0] in list_vowel:
					new_word = word[:] + 'yay'
				else:
					if word[1] not in list_vowel:
						new_word = word[2:] + word[:2] + 'ay'
					else:
						new_word = word[1:] + word[0] + 'ay'
		else:
			new_word = word
	else:
		if (word.isupper() and word.isalpha()):
			new_word = word + 'yay'
		else:
			new_word = word
	new_message.append(new_word)
print(new_message)
