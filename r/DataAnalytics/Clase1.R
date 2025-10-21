

#Tipos de datos

      x <- 4
      x
      
      #Datos Numericos
      entero <- 2L
      decimal <- 3.5
      
      is.integer(entero)
      is.double(decimal)
      
      is.numeric(entero)
      is.numeric(decimal)
      #Datos categoricos
      categorico <- "Masculino"
      facto <- factor("Femenino")
      
      is.character(categorico)
      is.factor(facto)
      
      is.factor(categorico)
    
      #Valores Logicos
      4<7
      logico <- FALSE
      is.logical(logico)
      
      #Otra forma de saber que tipo de dato
      class(entero)
      class(categorico)
      
              #Diferencia entre "=", "==" y "<-" (Asignación)
              suma <- 4+5
              suma
              
              suma1 = 4+5
              suma1
              
              6==5
              3==3
              

              
## TIPOS DE ESTRUCTURA     
              
          #VECTOR
          v  <- c(4,5,6)
          v
          class(v)
          
          s <- c("M","F","F","M")
          class(s)
          
          v1  <- c(4,5,6,"k")
          v1
          class(v1)
          
          v1 <- 2:40    
          v2 <- rep(3,5)
          v3 <- seq(1,7,by=2)
          
          v4 <- rep(  seq(1,7,by=2), 3 )
          
          
          v3 <-sample(1:100,size = 4)
          v4 <- runif(10,min = 0,max = 1)
          
                #Invocar a un elemento de un vector
                
                v4[2]
                
                
          #Matriz
          matriz <- matrix ( data = 1:6,nrow = 2,
                             byrow = TRUE) 
          matriz      
          
          matriz1 <- matrix ( data = 1:6,nrow = 2,
                              byrow = FALSE) 
          matriz1      
          
          #Array
          multi_dimension <- array ( data = 1:24,
                                     dim = c (2,3,4)
                                   )
          multi_dimension
          class(array)
          
          #Data.frame
          edad=c(3,4,5,6,8)
          altura=c(50.3,45.7,64.2,49.6,51.6)
          sexo=c("F","M","F","M","F")
          
          datos = data.frame(edad,altura,sexo)
          datos
          class(datos)
          str(datos)
          
                #Tipos datos
                install.packages("dplyr",dependencies = T)
                library(dplyr)
                glimpse(datos)
          
          dat1 = data.frame(var1=c(4,5,6),
                            var2=c("h","h","f"))
          dat1
          #Lista
          lista <- list ( v , matriz,
                         datos )
          lista
              
          v
          v^2
          
#Tipos de datos  NAN, NA, VACIO y NULL 
         sqrt(-25)
         log(-3)
         
         id=c(1,2,3,4,5)
         edad=c(15,NA,89," ",45)
         altura=c(123.4,156.8,98.6,87.7,90)
         dat = data.frame(id,edad,altura)         
         dat
         
         valor = c(15,NA,89,NULL,45)
         valor
         
#################################
#Aplicaciones
edad=c(43,46,55,69,71)
altura=c(85.3,149.7,112.2,89.6,76.6)
sexo=c("F","M","F","M","F")
pagador=c(1,0,1,0,0)
datos=data.frame(edad,pagador,sexo,altura)
datos
str(datos)
            
            
            #Apply
            datos
            datos[ , ]
            names(datos)
            
            datos$sum_filas = apply( datos[ , c("edad","altura")] , MARGIN =1 ,sum ) 
            datos
            
            sum_columnas = apply( datos[ , c("edad","altura")] , MARGIN =2 ,sum ) 
            sum_columnas 
            
            prom_columnas = apply( datos[ , c("edad","altura")] , MARGIN =2 ,mean ) 
            prom_columnas 
            
            #Tapply
            datos
            res_sexo=tapply(datos$altura , datos$sexo, mean)
            res_sexo
            
            res_sexo=tapply(datos$altura , list(datos$sexo,datos$pagador), mean)
            res_sexo
            
            #Sapply
            sapply( c(4,9,25), sqrt)
            
            datos
            sapply(datos, class)
            
############################################################################
#Datos
rm(list = ls())
edad=c(43,46,55,69,71)
altura=c(85.3,149.7,112.2,89.6,76.6)
sexo=c("F","M","F","M","F")
pagador=c(1,0,1,0,0)
datos=data.frame(edad,pagador,sexo,altura)
datos

str(datos)


#install.packages("summarytools",dependencies = T)
library(summarytools)
freq(datos$sexo)

      #Tranformando a tipo factor la variable sexo
      datos$sexo = as.factor(datos$sexo)
      str(datos)
      levels(datos$sexo)
       
      datos$sexo = factor(datos$sexo , levels = c("M","F"))
      freq(datos$sexo)
      str(datos)
      

        #Tabla de frecuencia
        freq(datos$pagador)
        datos$pagador = factor(datos$pagador)
        levels(datos$pagador)
        levels(datos$pagador) <- c("No moroso","Moroso")
        freq(datos$pagador)

        
############################################################################################################
  #Eliminar Notaci�n cientifica
  x <- 5e+10
  options(scipen=999)
  x

  datos
  for (i in 3:10) { print(i^2)
                      }
  
  if (6>3) {
      print("Es correcto")
      }
  
  
       
          
############################################################################################################
#Importancion de BD
rm(list=ls())
  
library(openxlsx)
library(haven)    
library(readxl)
  
    setwd("D:/Downloads")
    list.files()
    
    #txt, csv y excel
    datos_excel = read.xlsx("bsi.xlsx",sheet = "BD")
    head(datos_excel)
    
    datos_excel2= read_excel("bsi.xlsx",sheet = "BD")
    
    
    datos_csv = read.csv("diabetes_dataset.csv",sep=",",encoding = "UTF-8")
   
    datos_txt  =read.table("bsi.txt",header = T)
    
    summary(datos_diabetes$BMI)
    
    #dta (Stata)
    dat <- read_dta("carabayllo.dta")
    class(dat)
    head(dat)
    library(dplyr)
    glimpse(dat)
    str(dat)
    
    attr(dat$educ,"label")
    attr(dat$educ,"labels")
    
    
    dat$educ=as.factor(dat$educ)
    levels(dat$educ)
    levels(dat$educ)<-c("0-11 years", "hs or ged", "some coll", "coll grad+")
    library(summarytools)
    freq(dat$educ)
    attr()
    
    #sav (SPSS)
    # Datos de profesionales encuestados
    # La base de datos original esta en SPSS
    dat1=read_sav("CUESTIONARIO 02 - CAPITULOS.sav")
    attr(dat1$REGION,"label")
    attr(dat1$REGION,"labels")
    
    freq(dat1$REGION)
    
    dat1$REGION=factor(dat1$REGION)
    levels(dat1$REGION)
    
    levels(dat1$REGION)<-c("Costa","Selva","Sierra","Lima Metropolitana" )
    freq(dat1$REGION)
    
          #Separa variables categoricas y numericas
          nombre=data.frame(names(dat1))
          nombre$seleccionados = 0
          nombre[73:270,"seleccionados"]<-1
          
          grepl("h","hola")
          nombre$seleccionados1 = ifelse( grepl("O",nombre$names.dat1.)==TRUE,0,nombre$seleccionados )
          nombre1 = nombre[nombre$seleccionados1==1,]
          
                    #Transformando a numerica
                    for ( j in nombre1$names.dat1.) {
                          dat1[,j] = is.numeric(dat1[,j])
                          print(j)
                    }  
                    
                    write_sav(dat1,"dat1.sav")
          
          
############################################################################################################             
                    ##separando datos numericos de categoricos
                    tipo = data.frame(sapply(datos, class))
                    names(tipo) <- "tipo_var"
                    tipo$nombre_var = row.names(tipo)
                    row.names(tipo) <- 1:length(tipo$tipo_var)
                    tipo = tipo[,c(2,1)]
                    
                    dat_cuanti = dat1
                    
############################################################################################################
fprueba <- function (a,b) {
  return (a^2+b^2)
}
fprueba (a = 20,b = 10)


        #Funciones para tablas de frecuencia
        

############################################################################################################