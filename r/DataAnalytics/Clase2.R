rm(list=ls())
library(openxlsx)
library(haven)
library(summarytools)

setwd("D:/Downloads")
list.files()

#Extraer datos de Drive
    library(googlesheets4)
    gs4_auth()
    datos<-read_sheet("https://docs.google.com/spreadsheets/d/1oagQd3qxIJyXJ_L4rUeqDo8faXDYEOe9PTimpHjegOw/edit?gid=0#gid=0")
    
#Juntar archivos de Excel
    
    datos1=data.frame(var1=c(2,4,6),
                      var2=c(1,2,3))
    
    datos2=data.frame(var1=c(8,9,0),
                      var2=c(1,2,3))
    
    datos_f = rbind(datos1,datos2)
    
    
    #Cargando primera hoja del archivo Excel
    setwd("D:/Downloads")
    list.files()
    library(openxlsx)
    
    dat = read.xlsx("bsi.xlsx",sheet ="BD1" )
    
    library(readxl)
    hojas=excel_sheets("bsi.xlsx")
    hojas
    
    head(dat)
    
    BD0 = data.frame(horas_trab=NA,
                     num_llamadas=NA,
                     num_faltas=NA,
                     num_tard=NA,
                     sexo=NA,
                     sede=NA,
                     cargo=NA,
                     educ=NA )
    
    for (i in hojas) {
      BD = read.xlsx("bsi.xlsx",sheet = i)
      BD0 = rbind(BD0,BD)
      print(i)
    }
    
    
    BD0=BD0[-1,]
    BD0
    

#categorizar a variables numericas
    
    #1)
    rm(list=ls())
    setwd("D:/Downloads")
    library(haven)
    carabayllo = read_dta("carabayllo.dta")
    
    carabayllo$bmi_cat <- NULL
    
    head(carabayllo)
    attr(carabayllo$sex,"label")
    attr(carabayllo$sex,"labels")
    
    library(summarytools)
    freq(carabayllo$sex)  
    
    levels(carabayllo$sex)
    str(carabayllo$sex)
    
    carabayllo$sex = factor(carabayllo$sex)
    levels(carabayllo$sex)
    levels(carabayllo$sex) <- c("Masculino","Femenino")
    freq(carabayllo$sex) 
    
    #2)
    mean(carabayllo$bmi,na.rm = T)
    max(carabayllo$bmi,na.rm = T)
    
    head(carabayllo)
    carabayllo$bmi_cat = cut( carabayllo$bmi , breaks = c(0,18.5,25,30,56),
                              labels = c("Bajo peso","Normal","Sobrepeso","Obesidad"))
    
    summary(carabayllo$bmi)
    freq(carabayllo$bmi_cat)
    
    
#Funciones 
    suma_cuadrados <- function(a,b) {
                      return(a^2 +b^2)
      
    }
    
    suma_cuadrados(3,5)
    
    
    #Coeficiente de asimetria
    
    asimetria  <- function(x) {
          media =mean(x,na.rm=T)
          mediana=median(x,na.rm=T)
          desv = sd(x,na.rm=T)
          return(3*(media-mediana)/desv)
    }
    
    
    asimetria(c(3,4,5,6))
    
    asimetria(carabayllo$bmi)
    hist(carabayllo$bmi,col="steelblue")
    
    #Funciones para tablas de frecuencia

#FUNCION PARA LA TABLA DE FRECUENCIAS

tabla.frecuencias=function(x,k=sturges(length(x)),dec='0',ylab="Frecuencia",xlab="x",main="Titulo"){
        c=ceiling((1/k)*diff(range(x))*10^dec)/10^dec
        limites=seq(min(x),by=c,length.out = k+1)
        print("Breaks:")
        print(limites)
        temp=hist(x,breaks =limites,plot = FALSE)
        nj=temp$counts
        fj=prop.table(nj)
        pj=100*fj
        Nj=cumsum(nj)
        Fj=cumsum(fj)
        Pj=cumsum(pj)
        xj=seq(min(x)+c/2,by=c,length.out=k)
        Lim.sup = round(limites[-1],digits = 4)
        Lim.inf = round(limites[-(k+1)],digits = 3)
        
        tab=data.frame(Lim.inf=Lim.inf,
                       Lim.sup=Lim.sup,
                       x.j=xj,
                       n.j=nj,
                       f.j=round(fj,digits = 2),
                       p.j=round(pj,digits = 2),
                       N.j=Nj,
                       F.j=round(Fj,digits = 2),
                       P.j=round(Pj,digits = 2)
        )
        
        
        
        
        #hist(x, breaks =round(limites,digits = 3),xaxt="n",..., ylab = "Frecuencia", xlab = "x")
        hist(x, breaks =round(limites,digits = 3),xaxt="n",ylab = ylab, xlab = xlab,main=main)
        axis(1, at=round(seq(min(x),by=c,length.out = k+1),digits = 3),labels=round(seq(min(x),by=c,length.out = k+1),digits = 3))
        
        #print(tab)
        return(tab)
}

#Tabla de frecuencias de la variable edad
summary(carabayllo)
tabla.frecuencias(carabayllo$age,4,2,"Edad","kg/m�","Histograma")

    
    
    
#Seleccion de variables    
    
    num_interv = 1 +3.3*log(n)

    # Datos de profesionales encuestados
    # La base de datos original esta en SPSS
    rm(list = ls())
    setwd("D:/Downloads")
    list.files()
    dat1=read_sav("CUESTIONARIO 02 - CAPITULOS.sav")

          #Transformando variables categoricas a numericas
          nombre = data.frame(names(dat1))
          nombre
          head(nombre)
    
          library(dplyr)
          names(nombre)[1] <- "nom_var"
          
          head(nombre)
          nombre <- nombre %>%
                    rename(nom_variable=names.dat1.)
          head(nombre)
          
          
          nombre$selecionadas = 0
          head(nombre)
          
          nombre[48:270, "selecionadas" ] <-1
          
          grepl("h","hola")
          grepl("x","hola")
          grepl("o","hola")
          grepl("O",nombre$selecionadas)
          

          nombre$selec2 = ifelse( grepl("O",nombre$nom_variable) ==T,0,nombre$selecionadas)
          
          head(nombre)
          var_seleccionadas = nombre$nom_variable[nombre$selec2==1]
          
          class(dat1)
          dat1 = data.frame(dat1)
          class(dat1)
          str(dat1)
          
          for (j in var_seleccionadas) {
                    dat1[,j] = is.numeric(dat1[,j]) 
                    print(j)
                  }
          
          library(haven)
          library(openxlsx)
          write.xlsx(dat1 ,"dat1_transformadas.xlsx")
          
          
############################################################################################################             
                    ##separando datos numericos de categoricos
                    class(dat1)
          
                    dat1=read.xlsx("dat1_transformadas.xlsx")
                    dat1 = data.frame(dat1)

                    nombres = data.frame( names(dat1))
                    nombres <- nombres %>%
                               rename(nom_var =names.dat1. )
                    nombres$tipo_var =NA
                 
                    m=0
                    for (i in nombres$nom_var) {
                      m=m+1
                      nombres[ m,"tipo_var"] = class(dat1[ ,nombres[m,"nom_var"] ])
                    }
                    
                    tipo_datos =data.frame(sapply(dat1,class))
                    head(tipo_datos)
                    
                    
                    head(nombres)
                    library(summarytools)
                    freq(nombres$tipo_var)
                    
                    var_selec=nombres$nom_var[nombres$tipo_var=="numeric"]
                    var_selec_categ=nombres$nom_var[nombres$tipo_var=="character"]
                    
                    dat1_numericas = dat1[,var_selec ]
                    dat1_categoricas = dat1[,var_selec_categ ]


###########################################################################################################

                    rm(list=ls())
                    library(haven)
                    library(dplyr)
                    library(tidyr)
                    
                    setwd("D:/Downloads")
                    list.files()
                    datos=read_dta("nerlove63.dta")
                    head(datos)
                    
              
                    dat<-pivot_longer (
                      data = datos,cols = c ("plabor","pfuel","pkap"),
                      names_to = "variables",values_to = "valores"
                    )
                    
                    head(dat)
                    
                    dat1<-pivot_wider(dat,
                                      names_from = variables,
                                      values_from = "valores")
                    head(dat1)


###########################################################################################################
rm(list = ls())
library(openxlsx)
library(dplyr)          

        datos = read.xlsx("bsi2.xlsx",sheet = "BD")
        head(datos)                    

       #Filtrar a los trabajadores de la sede sur y sexo femenino
        
        dat1 <- datos %>%
                filter(sede=="sur" & sexo=="F")

        dat2 <- datos[datos$sede=="sur" & datos$sexo=="F",]
        
        
        #Porcentaje de quejas atendidas
        
        dat3 <- datos %>%
                mutate( porc_quejas = round(quejas_atendidas/num_llamadas*100,1))
        
        head(dat3)
        
        dat4 <- datos %>%
                filter(sexo=="F") %>%
                mutate( porc_quejas = round(quejas_atendidas/num_llamadas*100,1))
        
        #seleccionando variables
        dat5 <- datos  %>%
                select(horas_trab,cargo,sede,sexo) %>%
                filter(sexo=="F") 
        
        #Estadisticas resumen
        head(datos)
        
        dat6 <- datos %>%
                group_by(sexo, sede ) %>%
                summarise(prom_tiempo_llam = mean(tiempo_llamadas),
                          mediana=median(tiempo_llamadas),
                          minimo =min(tiempo_llamadas),
                          maximo =max(tiempo_llamadas),
                          casos=n(),
                          casos_unicos=n_distinct(tiempo_llamadas))
        dat6= data.frame(dat6)
        head(dat6)
        
#########################################################
        
        merge(BD1,BD2,by=)
        
        
        
        