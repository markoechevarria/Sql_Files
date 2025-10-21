
##########################################################################################
#REGRESION LOGISTICA

rm(list=ls())
library(summarytools)
library(ggplot2)
setwd("D:/Downloads")

data = data.frame(read.csv("morosidad.csv"))
head(data)
data$X <- NULL
str(data)
head(data)


#Variable dependiente
freq(data$moroso)

# ANÁLISIS EXPLORATORIO ---------------------------------------------------
# Diagrama de cajas (Cuantitativa y Cualitativa)
library(ggplot2)

ggplot(data = data, aes(x = moroso, y = ..count.., fill = moroso)) +
  geom_bar() +
  scale_fill_manual(values = c("gray50", "orangered2")) +
  labs(title = "Morosidad") +
  theme_bw() +
  theme(legend.position = "bottom")

prop.table(table(data$moroso))*100


 ggplot(data = data, aes(x = moroso, y = deuda, color = moroso)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(alpha = 0.3, width = 0.15) +
  scale_color_manual(values = c("gray50", "orangered2")) +
  theme_bw()

ggplot(data = data, aes(x = rangoEdad, y = ..count.., fill = moroso)) +
  geom_bar() +
  scale_fill_manual(values = c("gray50", "orangered2")) +
  labs(title = "Pclass") +
  theme_bw() +
  theme(legend.position = "bottom")


n=length(data[,1])

#####VARIABLE RESPUESTA
head(data)
library(summarytools)
freq(data$moroso)

      data$moroso = ifelse(data$moroso=="Moroso",1,0)
      freq(data$moroso)

#Convirtiendo la variable respuesta a factor
head(data)
str(data)
        #cambiando de tipo de variable
        data$moroso = as.factor(data$moroso)
        data$bancarizado = as.factor(data$bancarizado)
        data$historial = as.factor(data$historial)
        str(data)
#ss = sample(n,round(0.7*n))


#########################################################
#modelo de regresion
names(data)

#a) Data de entrenamiento
library(caret)
sample <- createDataPartition(y = data$moroso, p = 0.7, list = FALSE)

#Data de entrenamiento y test
data_train  <- data[sample, ]
data_test   <- data[-sample, ]

freq(data$moroso)
freq(data_train$moroso)
freq(data_test$moroso)

# AN?LISIS EXPLORATORIO ---------------------------------------------------
# Diagrama de cajas (Cuantitativa y Cualitativa)
boxplot(deuda~moroso, data = data_train)

# Porcentajes por columna (2 cualitativas)
prop.table(table(data_train$bancarizado,data_train$moroso), margin = 2)

#Modelo regresión con funcion de enlace "Logit"
head(data)
modelo <- glm(moroso ~rangoEdad+bancarizado+historial+deuda+tipo+
                 hijos+tarjetas,
               data=data_train,
               family = binomial)
summary(modelo)
freq(data_train$rangoEdad)


          
            #Cambiando orden de las variables
            data_train$rangoEdad = factor(data_train$rangoEdad ,
                                          levels=c("De 36 a 49","De 50 a mas","De 18 a 35"))
            freq(data_train$rangoEdad)
            
            data_train$rangoEdad = factor(data_train$rangoEdad ,
                                          levels=c("De 18 a 35","De 36 a 49","De 50 a mas"))
            
            
            #Modelo de regresion logistica
            modelo <- glm(moroso ~rangoEdad+bancarizado+historial+deuda+tipo+
                            hijos+tarjetas,
                          data=data_train,
                          family = "binomial")
            summary(modelo)
            
# SIGNIFICANCIA DEL MODELO GLOBAL -----------------------------------------

deviance_nulo <- modelo$null.deviance       
deviance_model <- modelo$deviance

chi <- deviance_nulo -deviance_model
gl <-  modelo$df.null - modelo$df.residual
sig_chi <- 1 - pchisq(chi,gl)
sig_chi


qchisq(1-0.05,gl)

          #Grados de libertad
          gl_model_nulo = 7001 -1  
          gl_model_nulo
          
          gl_model_completo = 7001 - 8 -1  
          gl_model_completo

#Bondad de ajusto del modelo mediante razon de verosimilitud
library(lmtest)

rlog0 <- glm(moroso ~1,data=data_train,family="binomial")

rlog <- glm(moroso ~rangoEdad+bancarizado+historial+deuda+tipo+
              hijos+tarjetas,data=data_train,family="binomial")
summary(rlog)

lik0 <- lrtest(rlog0 , rlog)
lik0

# INTERPRETACIÓN DE LOS COEFICIENTES --------------------------------------
# ===
# ODDS RATIO = e^(beta_j)
summary(modelo)
exp(coef(modelo))

# IC PARA EL ODDS RATIO

# OR estimado + IC al 95%
valor=exp(cbind(OR = coef(modelo), confint(modelo, level = 0.95)))
round(valor,3)



#################3########################################
#Capacidad predictiva del modelo
head(data_test)
data_test$prob_y = predict(modelo,data_test,type="response")
head(data_test)
        
          #Prediccion de ser moroso
          data_test$test_y = ifelse(data_test$prob_y>0.5,1,0) 
          head(data_test)

          
#Matriz de confusi?n
library(caret)
str(data_test$moroso)

conf.dt<-confusionMatrix( data_test$moroso,as.factor(data_test$test_y),positive = "1")
conf.dt

#g)Data de test

#Gráfico de la matriz de confusión

draw_confusion_matrix <- function(cm) {
  
  layout(matrix(c(1,1,2)))
  par(mar=c(2,2,2,2))
  plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')
  title('CONFUSION MATRIX', cex.main=2)
  
  # create the matrix 
  rect(150, 430, 240, 370, col='#3F97D0')
  text(195, 435, 'No moroso', cex=1.2)
  rect(250, 430, 340, 370, col='#F7AD50')
  text(295, 435, 'Moroso', cex=1.2)
  text(125, 370, 'Predicted', cex=1.3, srt=90, font=2)
  text(245, 450, 'Actual', cex=1.3, font=2)
  rect(150, 305, 240, 365, col='#F7AD50')
  rect(250, 305, 340, 365, col='#3F97D0')
  text(140, 400, 'No moroso', cex=1.2, srt=90)
  text(140, 335, 'Moroso', cex=1.2, srt=90)
  
  # add in the cm results 
  res <- as.numeric(cm$table)
  text(195, 400, res[1], cex=1.6, font=2, col='white')
  text(195, 335, res[2], cex=1.6, font=2, col='white')
  text(295, 400, res[3], cex=1.6, font=2, col='white')
  text(295, 335, res[4], cex=1.6, font=2, col='white')
  
  # add in the specifics 
  plot(c(100, 0), c(100, 0), type = "n", xlab="", ylab="", main = "DETAILS", xaxt='n', yaxt='n')
  text(10, 85, names(cm$byClass[1]), cex=1.2, font=2)
  text(10, 70, round(as.numeric(cm$byClass[1]), 3), cex=1.2)
  text(30, 85, names(cm$byClass[2]), cex=1.2, font=2)
  text(30, 70, round(as.numeric(cm$byClass[2]), 3), cex=1.2)
  text(50, 85, names(cm$byClass[5]), cex=1.2, font=2)
  text(50, 70, round(as.numeric(cm$byClass[5]), 3), cex=1.2)
  text(70, 85, names(cm$byClass[6]), cex=1.2, font=2)
  text(70, 70, round(as.numeric(cm$byClass[6]), 3), cex=1.2)
  text(90, 85, names(cm$byClass[7]), cex=1.2, font=2)
  text(90, 70, round(as.numeric(cm$byClass[7]), 3), cex=1.2)
  
  # add in the accuracy information 
  text(30, 35, names(cm$overall[1]), cex=1.5, font=2)
  text(30, 20, round(as.numeric(cm$overall[1]), 3), cex=1.4)
  text(70, 35, names(cm$overall[2]), cex=1.5, font=2)
  text(70, 20, round(as.numeric(cm$overall[2]), 3), cex=1.4)
}  


draw_confusion_matrix(conf.dt)

# BONDAD DE AJUSTE --------------------------------------------------------
# Pseudo-R2
# # En RL no existe un valor que indique la “variabilidad explicada” como en la RLM.
# Se puede calcular un valor similar a R^2 de los modelos lineales mediante el indicador llamado Pseudo R2 o también llamado McFadden
# Los valores oscilan entre 0 y 1.
# Pseudo-R2 que oscila entre 0.2 y 0.4 indica un muy buen ajuste del modelo.
# https://cowles.yale.edu/sites/default/files/files/pub/d04/d0474.pdf

# Cálculo de Pseudo-R2
(modelo$null.deviance - modelo$deviance)/modelo$null.deviance

# Mediante paquete
library(pscl)
pR2(modelo)


#g)

library(pROC)
test_roc = roc(data_test$moroso ~ data_test$test_y, plot = TRUE, print.auc =TRUE,legacy.axes=TRUE)

library(Epi)
ROC(data=data_test,form=moroso~rangoEdad+bancarizado+historial+deuda+tipo+
      hijos+tarjetas)


#USANDO EL VALOR DE LA CURVA ROC
#Prediccion de ser moroso
data_test$prob_y = predict(model_reduc,data_test,type="response")
head(data_test)
data_test$test_y2 = ifelse(data_test$prob_y>0.407,1,0) 
table(data_test$test_y2)
freq(data_test$test_y2)
summary(data_test$prob_y)

#Matriz de confusi?n
library(caret)
conf.dt2<-confusionMatrix( data_test$moroso,as.factor(data_test$test_y2),positive = "1")
conf.dt2
conf.dt
