###########################
# Asignacion de variables #
###########################

variable1 <- 1; variable2 <- 2
variable3 <- 3

##################
# Tipos de datos #
##################

typeof(3L)		# integer
typeof(3)		# double
typeof(3.5)		# double
typeof(3+5i)		# complex
typeof("HOLA")		# character
typeof(TRUE)		# logical


# is.integer(3L)
# is.double(3)
# ...
# is.logical(TRUE)

########################
# Operadores numericos #
########################

a <- 2; b <-4 

a + b		# suma
a - b 		# resta
a * b		# multiplicaciones
a / b		# division
a %/% b		# division entera
a %% b		# modulo
a ^ b		# exponencial


###########################
# Operadores relacionales #
###########################

a == b 		# igual que
a != b 		# diferente que 
a < b		# menor que
a > b		# mayor que
a <= b		# menor o igual que
a >= b		# mayor o igual que 

######################
# Operadores logicos #
######################

TRUE & TRUE	# and
TRUE | TRUE	# or 
! FALSE		# not

#########################
# Sentencias de control #
#########################

edad = 18
if (edad < 18) {
	print("Es menor de edad")
} else if ( edad == 18 ) {
	print("Tiene exactamente 18")
} else {
	print("Es mayor de edad")
}

nombres = c("Marko", "Percy", "Jhon", "Gabriel")
for (i in nombres) {
	print(i)
}

x = 256; total = 0
while (x>0) {
	total = total + x
	x = x - 1
}
total

#############
# Funciones #
#############

formula = function(x,y,z) {
	return (x*y*z)
}
formula(2,3,7)

###########
# Objetos #
###########

anios = c(1,2,3,4,5)					# vectores
letras = c("a","b","c","d")

matrix(1:12, nrow = 3, ncol = 4) 			# matrices
x1 = c(1,2,3,4)
x2 = c(11,12,13,14)
rbind(x1,x2)
cbind(x1,x2)

x2 = as.factor(c("Dia","Tarde","Noche")) 		# factores

df = data.frame(					# dataframes
	"entero" = 1:4,
	"factor" = as.factor(c("a","b","c","d")),
	"numero" = c(1.2, 2.4 , 3.6, 4.8),
	"cadena" = as.character(c("a","b","c","d"))
)

mi_lista = list("un_vector" = anios, "un_dataframe"=df)	# lista

####################
# Acceso a objetos #
####################

mi_vector = 1:10
mi_vector[1]
mi_vector[1:3]
mi_vector[c(1,2,5)]

mi_matriz = matrix(1:4, nrow=2)
mi_matriz[1,2]
mi_matriz[1:2, 1]
mi_matriz[1, c(1,2)]

mi_df = data.frame("num"=1:3, "left"=c("a","b","c"))
mi_df$num
mi_df["num"]
mi_df[c("num","left")]
mi_df$num[2]

mi_lista = list("un_vector"=mi_vector, "una_matriz"=mi_matriz,"un_df"=mi_df)
mi_lista$un_vector[2:5]
mi_lista$una_matriz[1,2]
mi_lista$un_df$num[2:3]

####################
# Eliminar objetos #
####################

rm(x1)
rm(x2)
rm(x1, x2)
rm(list = ls())
