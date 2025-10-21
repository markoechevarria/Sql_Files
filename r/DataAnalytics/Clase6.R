rm(list=ls())

library(haven)
library(summarytools)
#library(EnvStats)

setwd("D:/Downloads")
list.files()

datos=data.frame( read_dta("colesterol.dta"))
head(datos)

freq(datos$imc_cat)



#Analisis descriptivo
datos$imc_cat  =factor(datos$imc_cat,levels = c("Saludable","Sobrepeso","Obesidad"))
freq(datos$imc_cat)

#Analisis descriptivo

      #Grafico de cajas
      boxplot(datos$colesterol ~ datos$imc_cat, col="steelblue")
      
      #Resumen
      descr(datos$colesterol,datos$imc_cat)
      hist(datos$colesterol,col="steelblue")
      
#Anova
head(datos)
str(datos)
datos$imc_cat = as.factor(datos$imc_cat)

model1 = aov(datos$colesterol ~ datos$imc_cat)
summary(model1)

      #Analisis de supuestos
      library(ggfortify)
      autoplot(model1)
      plot(model1)

      #Normalidad
      hist(model1$residuals,col="steelblue")
      boxplot(model1$residuals,horizontal = T,col="steelblue")     
      
      options(scipen = 999)
      res=descr(model1$residuals)
      round(res,2)
      
      qqnorm(model1$residuals)
      qqline(model1$residuals)
      shapiro.test(model1$residuals)
        
      #Homocedasticidad
      datos$residuos = model1$residuals
      head(datos)
      
      boxplot(datos$residuos ~ datos$imc_cat, col="steelblue")
      
      bartlett.test(datos$colesterol ~ datos$imc_cat)
      
     
      
            library(car)
            leveneTest(datos$colesterol ~ datos$imc_cat, datos, center = "median")
            
            #Se aplica cuando no se cumple el supuesto de Homocedasticidad
            library(rstatix)
            model2=welch_anova_test(colesterol ~ imc_cat,data=datos)
            model2
            
# M?todo de Tukey usando 95% de confianza
TukeyHSD(model1, conf.level = 0.95)
plot(TukeyHSD(model1, conf.level = 0.95))

######################################################  
#PRUEBA NO PARAMETRICA
rm(list = ls())

library(haven)
datos = read_dta("cortisol.dta")
library(summarytools)
freq(datos$hospital)

          #Grafico de cajas
          boxplot(datos$cortisol ~ datos$hospital, col="steelblue")

          #Resumen
          descr(datos$cortisol,datos$hospital)
          
          #Grafico de cajas
          boxplot(cortisol$cortisol ~ cortisol$hospital, col="steelblue")

          #Anova
          head(datos)
          datos$hospital = as.factor(datos$hospital)
          datos = data.frame(datos)
  
  #ANOVA    
  model3 = aov(datos$cortisol ~ datos$hospital)
  summary(model3)

    
          #SUPUESTOS
          
          autoplot(model3)
          
          #Normalidad
          hist(model3$residuals)
          boxplot(model3$residuals,horizontal = T)     
          
          options(scipen = 999)
          res=descr(model3$residuals)
          round(res,2)
          
          qqnorm(model3$residuals)
          qqline(model3$residuals)
          shapiro.test(model3$residuals)
          
          #graficar con colores y leyendas
          head(datos)
          plot(density(datos$cortisol[datos$hospital==1]), col = "blue",
               xlim=c(0,1300),lwd=2)
          lines(density(datos$cortisol[datos$hospital==2]), col = "orange",lwd=2)
          lines(density(datos$cortisol[datos$hospital==3]), col = "green",lwd=2)
          legend("topright", c("Hosp. 1", "Hosp. 2", "Hosp. 3"),
                 lty = 1, col = c("blue", "orange", "green"))
          
        
          model4 = kruskal.test(datos$cortisol ~ datos$hospital)
          model4          
          
# M?todo de Tukey usando 95% de confianza
TukeyHSD(model4, conf.level = 0.95)
plot(TukeyHSD(model4, conf.level = 0.95))





#############################################################
#############################################################
#Anova de dos factores
rm(list=ls())
setwd("D:/Downloads")
list.files()
library(openxlsx)
datos = read.xlsx("datos_cosecha.xlsx")
head(datos)
names(datos)

str(datos)

#Grafico de interacci?n
library(ggpubr)
ggboxplot(
  datos, x = "Densidad", y = "Cosecha", 
  merge = TRUE,
  #palette =c("#00AFBB", "#E7B800", "#FC4E07"),
  color="Variedad"
)

interaction.plot(
  main="Interacci?n entre la Variedad de Jimotame y Densidad Plantaci?n",
  x.factor = datos$Densidad,
  trace.factor = datos$Variedad,
  response = datos$Cosecha,
  fun = mean,
  trace.label = "variedad",
  xlab = "Densidad",
  ylab = "Capacidad de Cosecha",type="b",lwd=2,
  col=1:3)
gg_dep()

datos$Variedad = as.factor(datos$Variedad)
datos$Densidad = as.factor(datos$Densidad)
str(datos)

#ANOVA
model_facto <- aov(Cosecha ~ Variedad + Densidad + Variedad*Densidad, data = datos)
summary(model_facto)


autoplot(model_facto)

#Normalidad
hist(model_facto$residuals,col="steelblue")
boxplot(model_facto$residuals,horizontal = T,col="steelblue")     

options(scipen = 999)

round( summaryFull(model_facto$residuals) ,3)
shapiro.test(model_facto$residuals)

#Homocedasticidas
bartlett.test(Cosecha ~ interaction(Variedad,Densidad) ,data=datos)
leveneTest(Cosecha ~ Variedad*Densidad ,data=datos, center = "median")



# M?todo de Tukey usando 95% de confianza
TukeyHSD(model_facto, conf.level = 0.95)

# Gr?fico usando 95% de confianza
plot(TukeyHSD(model_facto, conf.level = 0.95))
