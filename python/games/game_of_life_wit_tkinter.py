import tkinter as tk
import time

window = tk.Tk()
# window.geometry("600x600")
window.resizable(False, False)

main_frame = tk.Frame(window, padx=10, pady=10, bg="#dcdcdc")
main_frame.pack(fill="both", expand=True)

main_frame.rowconfigure(0, weight=1)
main_frame.columnconfigure(0,  weight=0)
main_frame.columnconfigure(1, weight=1)

frm_btn = tk.Frame(main_frame, relief=tk.RAISED, bd=1)
frm_board = tk.Frame(main_frame, relief=tk.RAISED, bd=2)

def restart_tablero(tabla):
	new_table = create_tablero_auxiliar(len(tabla[0]), len(tabla))
	# table = new_table
	actualizar_tablero(table)

lbl_iteracion = tk.Label(frm_btn, text="Iteracion 0" )
btn_start = tk.Button(frm_btn, text="Start" )
btn_pause = tk.Button(frm_btn, text="Pause" )
btn_restart = tk.Button(frm_btn, text="Restart", command= lambda:restart_tablero(table) )

lbl_iteracion.grid(row=0, column=0, sticky="ew", padx=5, pady=5)
btn_start.grid(row=1, column=0, sticky="ew", padx=5, pady=5)
btn_pause.grid(row=2, column=0, sticky="ew", padx=5, pady=5)
btn_restart.grid(row=3, column=0, sticky="ew", padx=5, pady=5)

frm_btn.grid( row=0, column=0, sticky="ns" )
frm_board.grid( row=0, column=1, sticky="nsew")

height=10
width=10

cells = [ [None for _ in range(width)] for _ in range(height) ]

for i in range(height):
	for j in range(width):
		btn = tk.Button(frm_board, width=2, height=1, bg="#b3a7a6", relief=tk.GROOVE, borderwidth=0.5)
		btn.grid(row=i, column=j, padx=0.1, pady=0.1)
		btn.bind("<Button-1>", lambda e, x=i, y=j: on_cell_click(x, y))
		if (i==2 and j==2):
			btn.config(bg="green")
		cells[i][j] = btn

def on_cell_click(i, j):
	cells[i][j].config(bg="green")
	table[i+1][j+1] = "#"
	time.sleep(0.2)
	print_table_auxiliar(table)

def create_tablero_auxiliar(height, width):
	table = []
	for x in range(height+2):
		if (x==0 or x==height+1): table.append( ["o" for a in range(width+2)] )
		else: table.append( ["o" if (a==0 or a==width+1) else " " for a in range(width+2)] )
	return table

table = create_tablero_auxiliar(height, width)

def print_table_auxiliar(table):
	height = len(table)
	width = len(table[0])
	for i in range(height):
		cont = 0
		for j in range(width):
			print(f"Celda {cont} -----", table[i][j])
			cont = cont + 1
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

def actualizar_tablero(table):
	height = len(table)
	width = len(table[0])
	for i in range(height):
		for j in range(width):
			if (table[i][j] == "#"):
				cells[i-1][j-1].config(bg="green")
			else: cells[i-1][j-1].config(bg="#b3a7a6")

window.mainloop()
