######################################################
################ Importamos la base ##################
######################################################

path = "D:/1. Briam/3. Modulos Dictados - GEM/6. Estadística y Análisis de Datos con R Studio/Inputs"
df = read.csv(file.path(path,"insurance.csv"), sep=',', header = TRUE)

###############################################################
################ Análisis Exploratorio (EDA) ##################
###############################################################

############# Estadisticos de Tendencia Central ###############

# 1. Media
mean(df[which(df$sex == "female"),"age"])
mean(df[which(df$sex == "male"), "age"])

# 2. Mediana
median(df[which(df$sex == "female"),"age"])
median(df[which(df$sex == "male"), "age"])

# 3. Moda
library(modeest)
mfv(df[which(df$sex == "female"),"age"])
mfv(df[which(df$sex == "male"), "age"])

# Auxiliar: La edad de las mujeres es bimodal
library(dplyr)
df%>%select(age, sex)%>%
  filter(sex == "female")%>%
  group_by(age)%>%
  summarise(n = n())

# Consulta: ¿Cómo puedo obtener toda la información en una sentencia?
df%>%select(age, sex)%>%
  group_by(sex)%>%
  summarise(media = mean(age), mediana = median(age), moda = mfv(age))

# R me aconseja usar reframe cuando tengamos dos salidas en una métrica
df%>%select(age, sex)%>%
  group_by(sex)%>%
  reframe(media = mean(age), mediana = median(age), moda = mfv(age))

############# Estadisticos de Dispersion ###############

# 1. Varianza
var(df[which(df$sex == "female"),"age"])
var(df[which(df$sex == "male"), "age"])

# 2. Desviacion estandar
sd(df[which(df$sex == "female"),"age"])
sd(df[which(df$sex == "male"), "age"])

# Auxiliar: La desviacion estandar es la raíz cuadrada de la varianza
sqrt(var(df[which(df$sex == "female"),"age"]))
sqrt(var(df[which(df$sex == "male"), "age"]))

# Consulta: ¿Que varianza se calculo, la poblacional o la muestral?
x1 = df[which(df$sex == "female"),"age"]
sum((x1-mean(x1))**2)/(length(x1)-1) 

# 3. Rango
range(df[which(df$sex == "female"),"age"])
range(df[which(df$sex == "male"),"age"])

# 4. Coeficiente de Variacion
sd(df[which(df$sex == "female"),"age"])/mean(df[which(df$sex == "female"),"age"])
sd(df[which(df$sex == "male"),"age"])/mean(df[which(df$sex == "male"),"age"])

############# Estadisticos de Posicion ###############

# 1. Cuartiles (Separacion de la data en 4 partes)
quantile(df[which(df$sex == "female"),"age"])
quantile(df[which(df$sex == "female"),"age"], c(3/4))
quantile(df[which(df$sex == "male"),"age"])
quantile(df[which(df$sex == "male"),"age"], c(3/4))

# 2. Deciles (Separacion de la data en 10 partes)
quantile(df[which(df$sex == "female"),"age"])
quantile(df[which(df$sex == "female"),"age"], c(5/10))
quantile(df[which(df$sex == "male"),"age"])
quantile(df[which(df$sex == "male"),"age"], c(5/10))

# 3. Percentiles (Separacion de la data en 100 partes)
quantile(df[which(df$sex == "female"),"age"])
quantile(df[which(df$sex == "female"),"age"], c(90/100))
quantile(df[which(df$sex == "male"),"age"])
quantile(df[which(df$sex == "male"),"age"], c(90/100))

# 4. Aplicación del boxplot: Detección de valores atípicos.
boxplot(df$bmi~df$sex, data = df,
        main = "Gráfico de cajas para BMI",
        col = c("lightblue","blue"))

q1 = quantile(df[which(df$sex == "male"),"bmi"], c (1/4))
q2 = quantile(df[which(df$sex == "male"),"bmi"], c (2/4))
q3 = quantile(df[which(df$sex == "male"),"bmi"], c (3/4))
iqr = q3-q1
li = q1-1.5*iqr
ls = q3+1.5*iqr

df_h = df[which(df$sex == "male"),]
df_h[which((df_h$bmi<li)|(df_h$bmi>ls)),]