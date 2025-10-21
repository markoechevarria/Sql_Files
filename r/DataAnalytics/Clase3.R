#Merge
rm(list=ls())
library(haven)
library(summarytools)
library(openxlsx)
library(stringr)

#Ubicación de las bases
setwd("D:/Downloads")
list.files()

#################################################################################################################
#Cargando archivos 

cap200 = read_dta("cap200.dta")
cap300 = read_dta("cap300.dta")
cap402 = read_dta("cap402.dta")

names(cap200)
var_id = c("ID", "HOGAR_ID", "PERSONA_ID")

toupper("hola")
str_trim(" hola")
chartr("ÁÉÍÓÚ","AEIOU","CANCIÓN")

#Eliminar espacios, transformar en mayusculas y eliminar tildes
var_id=c("ID","HOGAR_ID","PERSONA_ID")

for (i in var_id) {
  cap200_2019[,i]=chartr("ÁÉÍÓÚÜ", "AEIOUU", toupper(str_trim( cap200_2019[,i])))
  cap300_2019[,i]=chartr("ÁÉÍÓÚÜ", "AEIOUU", toupper(str_trim( cap300_2019[,i])))
  cap402_2019[,i]=chartr("ÁÉÍÓÚÜ", "AEIOUU", toupper(str_trim( cap402_2019[,i])))
  
}



#Uniendo cap 200 y 300
cap200_300 = merge(cap200 , cap300 , by=var_id )
cap200_300_1 = inner_join(cap200 , cap300 , by=var_id)

cap200_300_ALL = merge(cap200 , cap300 , by=var_id , all.x = T)
cap200_300_ALL_1 = left_join(cap200 , cap300 , by=var_id)

remove(cap200 , cap300,cap200_300_ALL )

#Uniendo cap200_300 con cap402

cap200_300_402 =merge( cap200_300 , cap402 , by =var_id)
remove(cap200_300 , cap402)


#Exportando datos

write_sav(cap200_300_402,"cap200_300_402.sav")   
write_dta(cap200_300_402,"cap200_300_402.dta")
write.xlsx(cap200_300_402,"cap200_300_402.xlsx")
write.csv(cap200_300_402,"cap200_300_402.csv")
write.table(cap200_300_402,"cap200_300_402.txt")

#MANIPULACION DE DATOS ---------------------------------------------------
library(haven)
library(dplyr)

setwd("D:/Downloads")
data_dta <- read_dta ("nerlove63.dta")
head(data_dta)
#Seleccionando variables

dat_selec1 <-  data_dta %>%
                  select ( totcost,plabor)

dat_selec2 <-  data_dta %>%
              select ( starts_with( c("p") ))

dat_selec3 <-  data_dta %>%
                select ( !starts_with( c("p") ))

dat_selec4 <-  data_dta %>%
               select ( starts_with( c("o","p") ))

across ( starts_with ( c("p") ) , .fn=log  )

dat_selec5 <- data_dta %>%
             mutate ( across(  starts_with( c("p"))  , .fn=sqrt )
                    )

#Aplicar raiz cuadrada a todas las variables que comienzan con P
        dat_selec <- data_dta %>%
          mutate (   across ( starts_with ( c("p") ) , .fn=log  ) )

        dat_selec2 <-  data_dta %>%
                        select ( starts_with( c("p") ))

        nombres <- paste0("x_",names(dat_selec2))
        names(dat_selec2) <- nombres
  

        data_dat1 <- cbind(data_dta,dat_selec2)
        head(data_dat1)
        
        
        dat_raiz <- data_dat1 %>%
                   mutate( across(starts_with (c("x_")),.fn=sqrt
                                 )
                         )
        
        
#MODELO DE REGRESION LINEAL SIMPLE
rm(list=ls())        
        
library(haven)
library(ggfortify)
library(lmtest)
library(car)
library(nortest)
library(EnvStats)        

setwd("D:/Downloads")

datos = read_dta("espirometria.dta")
head(datos)

#Diagrama de dispersión

plot(datos$talla , datos$vef,col="steelblue",
     main="Diagrama de dispersión entre el VEF y Altura")


modelo <- lm(datos$vef ~ datos$talla)
modelo <- lm(vef ~ talla, dat=datos)
summary(modelo)

r =sqrt(0.7537)
r
S

#Suma de cuadrados del total
SCT = var(datos$vef)*(654-1)


datos$vef_est = modelo$fitted.values
head(datos)

residuo = datos$vef - datos$vef_est
SCResid = sum(residuo^2)
SCResid

SCReg = SCT - SCResid
SCReg


p_valor = 1-pf(1995,1,652)
p_valor

https://colab.research.google.com/drive/1lcp6oGsNvt5aO0bUu1PHbzJjgsTz01e8#scrollTo=g6-blE85PnZb