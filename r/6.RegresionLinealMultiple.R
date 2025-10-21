################################################################################
########################## MODELO DE REGRESION LINEAL ##########################
################################################################################

# 1. Importamos la base de "insurance"
path = "D:/1. Briam/3. Modulos Dictados - GEM/6. Estadística y Análisis de Datos con R Studio/Inputs"
df = read.csv(file.path(path,"insurance.csv"), sep=',', header = TRUE)


# 2. Convertimos a todas nuestras variables categóricas en factores
df$sex <- factor(df$sex, levels = c("male","female"))
df$smoker <- factor(df$smoker, levels = c("yes","no"))
df$region <- factor(df$region, levels = c("southwest","southeast","northwest","northeast"))

# 3. Convertimos a nuestras variables en dummies
library(car)
df$sex_dum <- Recode(df$sex, 'c("male") = 1; c("female") = 0', as.factor = TRUE, levels = c(0,1))
df$smoker_dum <- Recode(df$smoker, '"yes" = 1; "no" = 0', as.factor = TRUE, levels = c(0,1))
df$dm_southwest <- Recode(df$region, '"southwest" = 1; c("southeast","northwest","northeast") = 0',
                          as.factor = TRUE, levels = c(0,1))
df$dm_southeast <- Recode(df$region, '"southeast" = 1; c("southwest","northwest","northeast") = 0',
                          as.factor = TRUE, levels = c(0,1))
df$dm_northwest <- Recode(df$region, '"northwest" = 1; c("southeast","southwest","northeast") = 0',
                          as.factor = TRUE, levels = c(0,1))

 # 4. Analizamos la correlación entre las variables

# 4.1. Las variables explicativas no están correlacionadas entre sí
var_cuant <- c("age","bmi","children")
for (i in 1:length(var_cuant)){
  for (j in 1:length(var_cuant)){
    if(i > j){
      print(cor(df[var_cuant[i]],df[var_cuant[j]]))
    }
  }
}
# 4.2. Las variables Sexo y Región no están relacionadas
# Ho: Las variables son independientes VS H1: Las variables son dependientes
var_cual <- c("sex","smoker","region")
for (i in 1:length(var_cual)){
  for(j in 1:length(var_cual)){
    if(i>j){
      print(var_cual[i])
      print(var_cual[j])
      print(chisq.test(table(df[var_cual[i]][,1],df[var_cual[j]][,1]))[3])
    }
  }
}

# 5. Seleccionamos solo las variables que entraran al modelo
library(dplyr)
df_mod <- select(df, c("age", "bmi", "children", "sex", "region", "charges"))

# 6. Reescalamos la variables cuantitativas
library(scales)
df_mod$age <- rescale(df_mod$age, c(0,1))
df_mod$bmi <- rescale(df_mod$bmi)
df_mod$children <- rescale(df_mod$children)

# 7. Separación de la data en train y test
library(caret)
set.seed(150)
indice <- createDataPartition(df_mod$charges, p = 0.8, list = FALSE)
df_train <- df_mod[indice,]
df_test <- df_mod[-indice,]
x_train <- cbind(1,select(df_train, -charges))
y_train <- df_train$charges
x_test <- cbind(1,select(df_test, -charges))


# 8. Ajustamos el modelo de regresión lineal
mod_reg <- lm(charges~., data = df_train)
summary(mod_reg)

################################################################################
######################## VERIFICACION DE LOS SUPUESTOS #########################
################################################################################

# 1. Linealidad: 
# Ho: Corr (X,Y) = 0 vs H1: Corr (X,Y) != 0
# Resultados: Todas las variables independientes cumplen la linealidad
plot(mod_reg,1)
cor.test(df_mod$charges,df_mod$age)
cor.test(df_mod$charges,df_mod$bmi)
cor.test(df_mod$charges,df_mod$children)

# 2. Normalidad de los residuos
# Ho: Los residuos se distribuyen normalmente.
# Reultados: Los residuos no se distribuyen normalmente
plot(mod_reg,2)
shapiro.test(mod_reg$residuals)

# 3. Homocedasticidad
# Ho: Existe homocedasticidad VS H1: Existe heterocedasticidad
# Resultados: El modelo es heterocedástico
plot(mod_reg,3)
ncvTest(mod_reg)

# 4. Ausencia de multicolinealidad
# Resultados: No existe multicolinealidad
library(DescTools)
VIF(mod_reg)

# 5. Ausencia de valores influyentes
# Resultados: No existen valores influyentes
plot(mod_reg,4)
cooks.distance(mod_reg)
which(cooks.distance(mod_reg)>1)