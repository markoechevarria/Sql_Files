rm(list=ls())
library(haven)
library(summarytools)

setwd("D:/Downloads")
datos = data.frame(read_dta("hersdata.dta"))
head(datos)

#SCT: SUMA DE CUADRADOS DEL TOTAL
summary(datos$LDL)
n=2763-11
SCT=var(datos$LDL,na.rm = T)*(n-1)
SCT
#################################################################
#Identificando datos faltantes
library(DataExplorer)
plot_missing(datos)

datos1=datos[,c("LDL","HT","age","nonwhite","smoking","drinkany",
               "physact","statins","glucose","BMI")]
plot_missing(datos1)

datos1=na.omit(datos1)
plot_missing(datos1)

#renombrar filas
row.names(datos1) = 1 : length(datos1$HT)
head(datos1)
#################################################################
#################################################################
#Hipotesis global
datos1$HT = as.factor(datos1$HT)
levels(datos1$HT) <- c("No recibio TH","Recibio TH")
head(datos1)

datos1$nonwhite = as.factor(datos1$nonwhite)
datos1$smoking = as.factor(datos1$smoking)
datos1$drinkany = as.factor(datos1$drinkany)
datos1$statins = as.factor(datos1$statins)
datos1$physact = as.factor(datos1$physact)


#Modelo de regresión
model1 = lm(LDL ~ HT + age+ nonwhite + smoking + drinkany + physact + 
                  statins + glucose + BMI , data=datos1)
summary(model1)
freq(datos1$physact)

model2 = lm(LDL ~. , data=datos1)


        #Para cambiar el valor de referencia
        datos1$physact = factor(datos1$physact ,levels = c(3,1,2,4,5))
        model1 = lm(LDL ~ HT + age+ nonwhite + smoking + drinkany + physact + 
                      statins + glucose + BMI , data=datos1)
        summary(model1)
        
        #Volviendo a su forma original
        datos1$physact = factor(datos1$physact ,levels = c(1,2,3,4,5))
        model1 = lm(LDL ~ HT + age+ nonwhite + smoking + drinkany + physact + 
                      statins + glucose + BMI , data=datos1)
        summary(model1)
        
#Calculo de AIC
extractAIC(model1)
        
          #AIC con datos del Modelo
          k=13
          n=dim(datos1)[1]
          SCE= sum(model1$residuals^2)

          AIC = 2*k + n*log(SCE/n)
          AIC

######################################################
#Gr?fico para variables Cuantitativas
library(psych)
head(datos1)
pairs.panels(x = datos1[,c("LDL","age","glucose","BMI")], 
            ellipses = FALSE, lm = TRUE, method = "pearson")

##############
library(GGally)
ggpairs(datos1[,c("LDL","age","glucose","BMI")],
              lower = list(continuous = "smooth"), 
            diag = list(continuous = "bar"), axisLabels = "none")

ggpairs(datos1[,c("LDL","age","glucose","BMI","HT")], lower = list(continuous = "smooth"), 
        diag = list(continuous = "bar"), axisLabels = "none")

#############################################################
#Analisis de supuestos

#De forma descriptiva
library(ggfortify)
autoplot(model1)

head(datos1)
#Calculando los residuos
datos1$LDL_est = model1$fitted.values
datos1$resid=model1$residuals
datos1$resid_estand=rstandard(model1)
datos1$resid_studen=rstudent(model1)

head(datos1)

#Normalidad

options(scipen = 999)
library(EnvStats)
round( summaryFull(model1$residuals),3)

boxplot(model1$residuals,horizontal = T)
hist(model1$residuals,col="steelblue",prob=T)
lines(density(model1$residuals))


#Prueba de normalidad
shapiro.test(model1$residuals)

    library(nortest)
    ad.test(model1$residuals)
#Homocedasticidad
library(lmtest)
bptest(model1)

#Multicolinealidad
library(car)
vif(model1)

#Autocorrelacion
library(car)
durbinWatsonTest(model1)

#####################################
summary(model1)
confint(model1)

#Selección de variables
model_completo = lm(LDL ~ HT + age+ nonwhite + smoking + drinkany + physact + 
              statins + glucose + BMI , data=datos1)

model_nulo = lm(LDL ~ 1 , data=datos1)

#Seleccion por Forward
forward_model <- step(model_nulo,
                       scope = list(lower=model_nulo, upper=model_completo),
                       direction = "forward")
summary(forward_model)

#Seleccion por backward
backward_model <- step(model_completo,
                      scope = list(lower=model_nulo, upper=model_completo),
                      direction = "backward")
summary(backward_model)

#Seleccion por stepwise
stepwise_model <- step(model_nulo,
                       scope = list(lower=model_nulo, upper=model_completo),
                       direction = "both")
summary(stepwise_model)
AIC(stepwise_model)

2

############################
summary(model1)
model_reducido = lm(LDL ~ statins + BMI + nonwhite +
                          age+drinkany, data=datos1)

summary(model_reducido)

# ESTIMACIÓN Y PREDICCIÓN -------------------------------------------------

# Supongamos, que se desea predecir LDL para un paciente que consume statinas, 
# Indice de masa corporal igual a 20.4, es de raza blanca, con una edad de 45 años
# que consume alcohol
# Nueva información
nuevos_datos <- data.frame(statins= 1, 
                           BMI=20.4,
                           nonwhite=0,
                           age=45,
                           drinkany=1)

nuevos_datos$statins = as.factor(nuevos_datos$statins)
nuevos_datos$nonwhite = as.factor(nuevos_datos$nonwhite)
nuevos_datos$drinkany = as.factor(nuevos_datos$drinkany)

# Predicción
predict(model_reducido, newdata = nuevos_datos)

# IC al 95% de la respuesta media
predict(model_reducido, newdata = nuevos_datos, interval = "confidence", level = 0.95)

# Intervalor de predicción al 95%
predict(model_reducido, newdata = nuevos_datos, interval = "predict", level = 0.95)

#######################################
#MEDIDA DE VALORES INFLUYENTES

library(car)
influencePlot(model = model1)

AIC(model_reducido)

model2 = lm(LDL ~ HT + age+ nonwhite + smoking + drinkany + physact + 
              statins + glucose + BMI , data=datos1[c(-164,-298,-897,-1759,
                                                      -2564,-2591),])
summary(model2)

#De forma descriptiva
library(ggfortify)
autoplot(model2)
boxplot(model2$residuals,horizontal = T)
hist(model2$residuals,col="steelblue")
summaryFull(model2$residuals)

#Normalidad
shapiro.test(model2$residuals)

ad.test(model2$residuals)

#Homocedasticidad

#Homocedasticidad
library(lmtest)
bptest(model2)

#Multicolinealidad
library(car)
vif(model2)

#Autocorrelacion
library(car)
durbinWatsonTest(model2)


############################
#MEDIDA DE VALORES INFLUYENTES

library(car)
influencePlot(model = model2)
