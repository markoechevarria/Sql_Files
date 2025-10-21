install.packages("ggplot2movies")
library(ggplot2movies)

install.packages("dplyr")
library(dplyr)

pelicula = movies
glimpse(pelicula)

##########
# RENAME #
##########

pelicula1 = rename(pelicula, anio="year", duracion="lenght", nombre_pelicula="title")

##########
# SELECT #
##########

pelicula2 = select(pelicula, title, length, votes, year) # selecciona columnas que se quieran mostrar
pelicula3 = select(pelicula, starts_with("r"))  # selecciona columnas que empiecen por "r"
pelicula4 = select(pelicula, contains("ma"))    # columnas que contengan "ma"
pelicula5 = select(pelicula, -title, -year, -lenth) # descarta peliculas con -
pelicula6 = select(pelicula, r1:r10, rating, year)  # selecciona rango de peliculas
pelicula7 = select(pelicula, nombre_pelicula="title", votos="vote", anio="year", length)


##################
# COMMAND FILTER #
##################

pelicula8 = filter(pelicula, year==2002)        # pelicula que cumple con una condicion
pelicula9 = filter(pelicula, year==2002 & rating <=5)   # pelicula que cumpla mas de una condicion
pelicula10 = filter(pelicula, year==2002 | rating <=5)  # pelicula que cumpla con alguna condicion
pelicula11 = filter(pelicula, year >= 2002 & year <= 2005) # pelicula en un rango
pelicula11 = filter(pelicula, between(year, 2002, 2005))
pelicula12 = filter(pelicula, year %in% c(2002, 2005, 2007))

#################
# COMMAND SLICE #
#################

# 1. Uso: Permite filtrar filas por sus ubicaciones.
pelicula[20:25,]
pelicula14 = slice(pelicula, 20:25)

# 2. Head: Selecciona una cantidad "X" de las primeras filas
head(pelicula, 10)
pelicula15 = slice_head(pelicula, n = 10)

# 3. Tail: Selecciona una cantidad "X" de las Ultimas filas
tail(pelicula, 10)
pelicula16 = slice_tail(pelicula, n = 10)

# 4. Sample: Selecciona una muestra de la BB.DD
set.seed(12)
pelicula17 = slice_sample(pelicula, n = 100)

# 5. Min: Selecciona todos los registros que tengan el valor minimo de una variable
filter(pelicula, year == min(year))
pelicula18 = slice_min(pelicula, year)

# 6. Max: Selecciona todos los registros que tengan el valor maximo de una variable
filter(pelicula, year == max(year))
pelicula19 = slice_max(pelicula, year)

###########################################
############# Comando Mutate ##############
###########################################

# 1. Uso: Permite realizar transformaciones de variables en un dataframe
glimpse(pelicula) 
pelicula20 = mutate(pelicula, ratio_pelicula = rating/votes)

# 2. Con la funciOn if_else
glimpse(pelicula) 
pelicula21 = mutate(pelicula, vigencia = if_else(year < 2000, "pelicula antigua", "pelicula reciente"))

# 3.Con varias funciones if_else
glimpse(pelicula) 
pelicula22 = mutate(pelicula, ratio_pelicula = rating/votes,
                    rating_level = if_else(rating > 6, "pelicula buena",
                                           if_else(rating <= 6 & rating > 3, "pelicula normal",
                                                   "pelicula mala")))
                   

# 4. Con la funciOn case when
glimpse(pelicula) 
pelicula23 = mutate(pelicula, ratio_pelicula = rating/votes,
                    rating_level = case_when(rating <= 3 ~ "pelicula mala",
                                             rating <= 6 & rating > 3 ~ "pelicula normal",
                                             rating > 6 ~ "pelicula buena"))


# 5. Operaciones entre columnas
glimpse(pelicula)
pelicula24 = mutate(pelicula, producto = rating*votes)

###########################################
############ Comando Transmute ############
###########################################

# 1. Uso: Tiene la misma funcionalidad que Mutate con la diferencia que 
# en esta funcion solo se muestran las variables transformadas
glimpse(pelicula)
pelicula25 = transmute(pelicula, year, ratio=rating/votes,
                        rating_level= if_else(rating>6, "pelicula buena",
                                              if_else(rating<=6 & rating>3, "pelicula normal", "pelicula mala")))
glimpse(pelicula25)

###########################################
############# Comando Arrange #############
###########################################

# 1. Uso: Tiene la misma funcionalidad que Select
# con la diferencia que esta varia el orden de 
# sus filas; por lo tanto, se usa mucho para ordenar

# 2. Ordena la variable rating
pelicula26 = arrange(pelicula, rating)
pelicula26

# 3. Signo Negativo: Ordena la variable de forma descendente
pelicula27 = arrange(pelicula, -rating)
pelicula27

# 4. Funcion desc: Ordena la variable de forma descendente
pelicula28 = arrange(pelicula, desc(rating))
pelicula28

# 5. Ordenar mas de dos variables. En este caso primero ordena year y luego rating
pelicula29 = arrange(pelicula, year, rating)
pelicula29

###########################################
###### Combinacion de funciones (%>%) #####
###########################################

base_final = pelicula %>%
  select(nombre_pelicula = "title", anio = "year", duracion = "length", rating, votes) %>%
  filter(anio %in% c(2002,2005)) %>%
  mutate(ratio = rating/votes, antiguedad = if_else(anio < 2000, "antigua", "nueva"),
         rating_level = case_when(rating > 6 ~ "buena",
                                  rating <= 6 & rating > 3 ~ "normal",
                                  rating >3 ~ "buena"))
base_final

###########################################
################ Summarise ################
###########################################

resumen = summarise(pelicula, promedio =mean(votes),
          maximo = max(votes),
          minimo = min(votes), 
          sumaria_total=n())
resumen
