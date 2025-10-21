
#Gráficos        
rm(list=ls())
setwd("D:/Downloads")

datos = read.csv("bsi.csv")
head(datos)

library(summarytools)
freq(datos$sede)

#Univariado
tabla =prop.table(table(datos$sede))*100
tabla=round(tabla,2)

barplot(tabla)

Grafico <-barplot(tabla,
                  col=c("orange","blue","green"),
                  ylim = c(0,100),
                  #legend = rownames(tabla),
                  space = 0.5
                  )

          #pos: ubicacion del valor del porcentaje
          #cex:Tamaño del valor del porcentaje
          text(Grafico, y=tabla, pos=3, cex=1.0, col="black",
               label=paste0(round(tabla,1),"%"))
          
          #Para colocar leyenda
              #leyenda: "top", "topleft", "topright", "bottom", "bottomleft", "bottomright"
              #x = "topright",
              legend(x = "topright",
                     rownames(tabla),
                     fill = c("orange","blue","green"))   #Color 

#En ggplot2 
library(ggplot2)
library(dplyr)
              
df <- data.frame(var = c("A", "A", "A", 
                          "B", "B", "B", "B", "B",
                          "C", "C", "C", "C", "C", "C"))              

ggplot(df, aes(x = var)) +
  geom_bar()

df %>% ggplot( aes(x = var)) +
       geom_bar()

        #Agrupando los valores de la variable
        df2 <- df %>%
               group_by(var) %>%
               summarise(casos=n())
        
        ggplot(df2, aes(x = var,y=casos)) +
          geom_bar(stat = "identity")
        
        
        ggplot(df2, aes(x = var, y = casos)) +
          geom_bar(stat = "identity") +
          ylim(0,9) +
          coord_flip()
        
        #Barras en forma verticak
        ggplot(df2, aes(x = var, y = casos)) +
          geom_bar(stat = "identity") +
          ylim(0,9) +
          coord_flip()
        
        #Aumentando las etiquetas
        df2
        ggplot(df2, aes(x = var, y = casos)) +
        geom_bar(stat = "identity") +
        geom_text(aes(label = casos), vjust = -0.2, colour = "black")
        
        #Color a las barras
        df2
        ggplot(df2, aes(x = var, y = casos,fill=var)) +
          geom_bar(stat = "identity") +
          geom_text(aes(label = casos), vjust = -0.2, colour = "black")
        
        
        
        ggplot(df2, aes(x = var, y = casos)) +
          geom_bar(stat = "identity",fill=4) +
          geom_text(aes(label = casos), vjust = 2, colour = "black")
              
        
        #En el ejemplo de la sede
        tabla =prop.table(table(datos$sede))*100
        tabla=data.frame(tabla)
        tabla$Freq = round(tabla$Freq,2)
        
        ggplot(tabla, aes(x = Var1, y = Freq)) +
          geom_bar(stat = "identity",fill=3) +
          ylim(0,90) +
          geom_text(aes(label = Freq), vjust = -0.1, colour = "black")+
          ylab("Porcentaje")+
          xlab("Sede de trabajo")
        
        
#Bivariado
list.files()
d=read.csv("ObesityDataSet_cleaned_and_data_sinthetic.csv")
names(d)

table(d$NCP)
table(d$Gender)

barplot( table(d$Gender,d$NCP) , beside = T)

Grafico=barplot(prop.table(table(d$Gender,d$NCP),1),beside=TRUE,legend=TRUE,
        xlab="variable número de comidas por día (NCP) ", ylab="Frecuencia relativas",ylim = c(0,0.80),
        col=c("lightblue","blue"), main="Distribuciones de frecuencias relativas de la variable \n número de comidas por día (NCP) entre el género (Gender). ")

text(Grafico, y=prop.table(table(d$Gender,d$NCP),1), pos=3, cex=0.8, col="black",
     label=round(prop.table(table(d$Gender,d$NCP),1), 2))

# VISUALIZACION DE DATOS --------------------------------------------------
rm(list=ls())
library (magrittr)
library(tidyr)
library(ggplot2)
library(summarytools)             
library(dplyr)               
             
# PARTE 1
mtcars

datos<- mtcars %>% pivot_longer (
        cols = c ("disp","hp"),
        names_to = "variables",
        values_to = "values") 

head(datos)  
  #Gráfico de dispersión
  plot(datos$mpg , datos$values)

  datos %>% ggplot ( aes (x = mpg,y = values)) +
  geom_point ()

  datos %>% ggplot ( aes (x = mpg,y = values)) +
    geom_point ( aes(colour = variables) )
  
  datos %>% ggplot ( aes (x = mpg,y = values)) +
    geom_point ( aes(colour = variables) ) +
    facet_wrap (facet = ~ "Gráfico de dispersión")
  
  #Gráfico de dispersión con notas
    datos %>% ggplot ( aes (x = mpg,y = values)) +
    geom_point ( aes(colour = variables) ) +
    facet_wrap (facet = ~ "Gráfico de dispersión")  +
    
    labs ( title = "Mi primera imagen",caption = "este es un pie de pagina",
           x = "Cantidad",y = "Valores",colour = "Variables") +
           scale_colour_discrete (labels = c ("disp","hp")) + 
           theme (legend.position = "bottom",
                  text = element_text (size = 12),
                  plot.title = element_text (face = "bold")
           )
  
  
  #Gráfico de dispersión desagreado por alguna variable
    head(datos)
  datos %>% ggplot (mapping = aes (x = mpg,y = values)) +
    geom_point () + 
    facet_wrap (facets = ~ variables)
  
  
  datos %>% ggplot (mapping = aes (x = mpg,y = values)) +
            geom_point (aes (colour = am)) + 
            facet_wrap (facets = ~ variables)
  
  datos$am = as.factor(datos$am)
  
  datos %>% ggplot (mapping = aes (x = mpg,y = values)) +
    geom_point (aes (colour = am)) + 
    facet_wrap (facets = ~ variables)
  
  datos %>% ggplot (mapping = aes (x = mpg,y = values)) +
    geom_point (aes (colour = am)) + 
    facet_wrap (facets = ~ variables) +
    
    labs ( title = "Mi primera imagen",caption = "este es un pie de pagina",
           x = "Cantidad",y = "Valores",colour = "Variables") +
    scale_colour_discrete (labels = c ("Automatico","Mecanico")) + 
    theme (legend.position = "bottom",
           text = element_text (size = 12),
           plot.title = element_text (face = "bold")
    )
  
  
  #Gráfico de dispersión según 
  mtcars
  mtcars %>% mutate ( marcas = rownames (mtcars)) %>%
    ggplot ( aes (x = mpg,y = hp)) +
    geom_point( ) +
    geom_text (aes (y = hp,label = marcas))
  
  
  mtcars %>% mutate ( marcas = rownames (mtcars)) %>%
             ggplot ( aes (x = mpg,y = hp)) +
             geom_point( ) +
             geom_text (aes (y = hp,label = marcas),
             check_overlap = TRUE )

  
  setwd("D:/Downloads")
  library(haven)
  nerlove63=read_dta("nerlove63.dta")  
  head(nerlove63)

  
  data_dta <-nerlove63 %>% 
                 relocate ( pkap,.before = pfuel) %>% 
                 rename_with ( .cols = everything (),
                              .fn = ~ c ("TC","Q","p1","p2","p3")) %>% 
                 arrange (Q) %>% 
                 mutate (group = cut (x = Q,breaks = c (-Inf,196,719,1474,3286,Inf),
                                      labels = c ("A","B","C","D","E")) )

  
      #En el ejemplo de la sede
      tabla =prop.table(table(data_dta$group))*100
      tabla=data.frame(tabla)
      tabla$Freq = round(tabla$Freq,2)
      
      ggplot(tabla, aes(x = Var1, y = Freq)) +
        geom_bar(stat = "identity",fill=3) +
        ylim(0,30) +
        geom_text(aes(label = Freq), vjust = -0.1, colour = "black")+
        ylab("Porcentaje")+
        xlab("Grupo")
      

## PARTE 2

## TABULACION DE VARIABLES Y DISTRIBUCION DE FRECUENCIAS
freq(data_dta$group)    
data_dta
data_fc <- data_dta %>% count ( group,name = "freq_abs") %>% 
                        mutate (values = seq (from = 1,length.out = length (group)),
                        freq_rel = freq_abs/sum (freq_abs),
                        freq_per = round (x = freq_rel*100,digits = 2),
                        cumu_abs = cumsum (freq_abs),
                        cumu_rel = cumsum (freq_rel),
                        cumu_per = cumsum (freq_per)) %>% 
                        relocate (values,.before = "freq_abs")

library(stargazer)

data_fc %>% as.data.frame () %>% 
            stargazer (type = "text",summary = FALSE,rownames = FALSE,
            title = "Distribución de frecuencias")


## PIE PLOT
plot_pie <- data_fc %>% 
            ggplot (aes (x = "",y = freq_rel)) + 
            geom_col (aes (fill = group)) + 
            geom_text (aes (label = freq_per),size = 2.5,
                       position = position_stack (vjust = 0.5)) + 
            labs (fill = "Group") + 
            coord_polar (theta = "y") + 
            theme ( axis.title = element_blank (),
                    legend.position = "bottom",
                    legend.key.size = unit (x = 0.25,units = "cm")
            )
plot_pie

## STEP PLOT
plot_step <- data_fc %>% 
             ggplot (aes (x = values,y = cumu_abs)) + 
             geom_step () + 
             geom_point () + 
             labs ( x = "Values",y = "Cumulative Absolute")
plot_step

## OGIVE PLOT
plot_ogive <- data_fc %>% 
              ggplot (aes (x = values,y = cumu_per)) + 
              geom_line () +
              geom_point () + 
              labs (x = "Values",y = "Cumulative Percent")
plot_ogive


## HISTOGRAM
plot_hist <- data_dta %>% 
             ggplot ( mapping = aes (x = p2)) + 
             geom_histogram (bins = 20) + 
             labs ( x = "Price of Capital",y = "Frequency")
plot_hist

## DENSITY
plot_density <- data_dta %>% 
                ggplot (aes (x = p2)) + 
                geom_density () + 
                labs (x = "Price of Capital",y = "Density")
plot_density

## SCATTER PLOT
plot_point <- data_dta %>% 
              mutate (Q = Q/1000) %>% 
              ggplot (aes (x = Q,y = TC)) + 
              geom_point () + 
              labs (x = "Output (TN KwH)",y = "Total Cost (MM USD)")
plot_point


## LINE PLOT
library(tsibble)

plot_line <- AirPassengers %>% 
             as_tsibble () %>% 
             as_tibble () %>% 
             mutate ( index = as.Date (index)) %>% 
             ggplot (aes (x = index,y = value)) +
             geom_line () + 
             labs (x = "Time (Months)",y = "Passangers")

plot_line
## GUARDAR GRAFICOS
### Esta seccion no es necesario que lo corran porque solo es para
### generar los graficos para mis diapositivas PDF en LaTeX.
### Por lo tanto, solo necesitan visualizarlo aqui en RStudio
list (
    plot_pie,plot_step,plot_ogive,
    plot_hist,plot_density,plot_line,plot_point
) %>% purrr::map2 (
    .y = c (
        "plot_pie.png","plot_step.png","plot_ogive.png",
        "plot_hist.png","plot_density.png","plot_line.png","plot_point.png"
    ),
    .f = function (m,n) return (
        ggplot2::ggsave (
            plot = m,filename = n,width = 7.75,height = 6,scale = 0.8,
            units = "cm",path = "../Diapositiva/figures/"
        )
    )
)
1        
        