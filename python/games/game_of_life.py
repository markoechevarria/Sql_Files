import time
import copy
import random
import os

def create_table(height, width):
	table=[]
	for x in range (height+2):
		if (x == 0 or x==height+1): table.append( ["o" for a in range(width+2)] )
		else: table.append( [ "o" if (a==0 or a==width+1) else " " for a in range(width+2)] )
	return table

def print_table(table):
	for x in range(len(table)):
		for y in range(len(table[x])):
			print(table[x][y], end='  ')
		print("")

def verified_cells(table):
	new_table = copy.deepcopy(table)
	contador = 1
	for x in range(len(table)):
		for y in range(len(table[x])):
			if ( not ( x==0 or x==len(table)-1 or y==0 or y==len(table[x])-1) ):
				list_neighbour = []
				list_neighbour.extend( [ table[x-1][y-1], table[x-1][y], table[x-1][y+1], table[x][y-1], table[x][y+1], table[x+1][y-1], table[x+1][y], table[x+1][y+1] ] )
				cont = 0
				for index in range(len(list_neighbour)):
					if list_neighbour[index] == "#": cont = cont +1

				if ( table[x][y] == "#" ):
					if cont == 3 or cont == 2: new_table[x][y] = "#"
					else: new_table[x][y] = " "
				elif (table[x][y] == " "):
					if cont == 3: new_table[x][y] = "#"
					else: new_table[x][y]  = " "
	return new_table

def random_cells(table):
	for i in range( int(( len(table)  * len(table[0]) )//3) ):
		table[random.randint(1, len(table)-2 )][random.randint( 1, len(table[0])-2 )] = "#"
	return table

def start(height, width, num_iterations=10000):
	tabla = create_table(height, width)
	tabla = random_cells(tabla)

	for i in range(num_iterations):
		os.system("clear")
		print(f"This is the iterration: {i}")
		print_table(tabla)
		tabla = verified_cells(tabla)
		time.sleep(0.02)

start(15, 15)
