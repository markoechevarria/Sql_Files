## FUNCIONES

def suma(numeros):
    total = 0
    for n in numeros:
        total += n
    return total
suma([1,3,5,4])

def suma(*numeros):
    print(type(numeros))
    total = 0
    for n in numeros:
        total += n
    return total
suma(1, 3, 5, 4)

def suma(**kwargs):
    """
    Esta funcion toma un diccionario de datos e imprime los pares clave - valor
    """
    suma = 0;
    for key, value in kwargs.items():
        print(key, value)
        suma += value
    return suma
suma(a=5, b=20, c=23)
help(suma)

def sumar(a: int, b: int) -> int:
    return a + b
valor = sumar(1,2)
print(valor)

### args y kwargs

def funcion(a, b, *args, **kwargs):
    print("a =", a)
    print("b =", b)
    for arg in args:
        print("args =", arg)
    for key, value in kwargs.items():
        print(key, "=", value)

funcion(10, 20, 1, 2, 3, 4, x="Hola", y="Que", z="Tal")

def sumar(a: int, b: int) -> int:
    return a + b
print(sumar.__annotations__)

## FUNCION LAMBDA

numero = lambda a, b: a + b
print(numero(10,100))

print( (lambda a, b: a + b)(2, 4) )
print( (lambda **kwargs: sum(kwargs.values()))(a=1, b=2, c=3) )

### DECORADORES

def di_hola():
    print("Hola")
    
f1 = di_hola() # Llama a la función
f2 = di_hola   # Asigna a f2 la función

print(f1)      # None, di_hola no devuelve nada
print(f2)      # <function di_hola at 0x1077bf158>

#f1()          # Error! No es válido
f2()           # Llama a f2, que es di_hola()

del f2         # Borra el objeto que es la función 
#f2()          # Error! Ya no existe

di_hola()      # Ok. Sigue existiendo

def operaciones(op):
    def suma(a, b):
        return a + b
    def resta(a, b):
        return a - b
    
    if op == "suma":
        return suma
    elif op == "resta":
        return resta
    
funcion_suma = operaciones("suma")
print(funcion_suma(5, 7)) # 12

funcion_suma = operaciones("resta")
print(funcion_suma(5, 7)) # -2

