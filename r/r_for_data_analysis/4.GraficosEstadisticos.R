 ######################################################
################ Importamos la base ##################
######################################################
library(ggplot2)
library(dplyr)
path = "D:/1. Briam/3. Modulos Dictados - GEM/6. Estadística y Análisis de Datos con R Studio/Inputs"
df = read.csv(file.path(path,"insurance.csv"), sep=',', header = TRUE)

# Analizamos la variable BMI
k = round(1+3.3*log10(length(df$age)))

################################################################################
############################ GRÁFICO DE HISTOGRAMA #############################
################################################################################

# 1. Gráfico total
hist1 <- ggplot(aes(x = bmi), data = df)+
  geom_histogram(bins = k, aes(y = ..density..), color = "black", fill = "darkblue")+
  geom_density(lwd = 1, color = "red", linetype = 1)+
  ggtitle("Histograma de BMI")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("BMI")+
  ylab("Frecuencia")
hist1

# 2. Desagregado por variable
hist2 <- ggplot(aes(x = bmi), data = df)+
  geom_histogram(bins = k, aes(y = ..density.., fill = sex), color = "yellow")+
  scale_fill_manual(values = c("red", "blue"))+  
  geom_density(lwd = 1, color = "red", linetype = 1)+
  labs(title="Histograma de BMI por sexo",
       x="BMI",
       y="Frecuencia", caption="Elaborado por:") +
  theme(plot.title= element_text(hjust = 0.5,
                                 color = "black",
                                 size = 10,
                                 face = "bold.italic"))+
  facet_grid(~sex)

hist2

################################################################################
############################ POLIGONO DE FRECUENCIA ############################
################################################################################

# 1. Gráfico total
pol1 <- ggplot(aes(x = bmi), data = df)+
  geom_histogram(bins = k, color = "black", fill = "darkblue")+
  geom_freqpoly(bins = k, lwd = 1, color = "red")+
  ggtitle("Histograma de BMI")+
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("BMI")+
  ylab("Frecuencia")
pol1

# 2. Desagregado por variable
pol2 <- ggplot(aes(x = bmi), data = df)+
  geom_histogram(bins = k, color = "yellow", aes(fill = sex))+
  scale_fill_manual(values = c("red", "blue"))+
  geom_freqpoly(bins = k, lwd = 1, color = "red")+
  labs(title="Histograma de BMI por sexo",
       x="BMI",
       y="Frecuencia", caption="Elaborado por:") +
  theme(plot.title= element_text(hjust = 0.5,
                                 color = "black",
                                 size = 10,
                                 face = "bold.italic"))+
  facet_grid(.~sex)                    
pol2

################################################################################
############################## DIAGRAMA DE BARRAS ##############################
################################################################################

# 1. Gráfico total
bar1 <- ggplot(aes(x = sex), data = df) + 
  geom_bar(width = 0.5, colour = "yellow", aes(fill = sex)) +
  scale_fill_manual(values = c("red","blue"))+
  coord_flip()+
  ggtitle("Diagrama de barras de la variable BMI") +
  theme(plot.title = element_text(hjust = 0.1))+
  xlab("BMI")+
  ylab("Frecuencia")
  
bar1

# 2. Desagregado por variable
bar1 <- ggplot(aes(x = region), data = df) + 
  geom_bar(width = 0.5, colour = "yellow", aes(fill = region), position = "dodge") +
  scale_fill_manual(values = c("red","blue","purple","lightblue"))+
  coord_flip()+
  ggtitle("Diagrama de barras de la variable BMI") +
  theme(plot.title = element_text(hjust = 0.1))+
  xlab("BMI")+
  ylab("Frecuencia")+
  facet_grid(.~sex)
bar1

################################################################################
############################### GRAFICO DE LINEAS ##############################
################################################################################

# Prepocesamos la data para hacer el gráfico de líneas

# 1. Gráfico total
df_linea1 = df%>%group_by(age)%>%
  summarise(valor = mean(charges, rm.na = TRUE))

linea1 <- ggplot(aes(x = age, y = valor), data = df_linea1)+
  geom_line(color = "darkblue")+
  ggtitle("Gráfico de líneas - Charges") +
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("Age")+
  ylab("Charges")
linea1

# 2. Desagregado por variable
df_linea2 = df%>%group_by(age,region)%>%
  summarise(valor = mean(charges, rm.na = TRUE))

linea2 <- ggplot(aes(x = age, y = valor, color = region), data = df_linea2)+
  geom_line()+
  scale_fill_manual(values = c("red","blue","purple","lightblue"))+
  ggtitle("Gráfico de líneas - Charges") +
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("Age")+
  ylab("Charges")+
  facet_grid(.~region)
linea2

################################################################################
############################# GRAFICO DE DISPERSION ############################
################################################################################

# 1. Gráfico total
dispersion1 <- ggplot(aes(x = bmi, y = charges), data = df)+
  geom_point(size = 1.5, shape = 17, color = "darkblue")+
  geom_smooth(method = "lm", color = "red", se = TRUE)+
  ggtitle("Gráfico de Dispersión") +
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("BMI")+
  ylab("Charges")
dispersion1

# 2. Desagregado por variable
dispersion2 <- ggplot(aes(x = bmi, y = charges), data = df)+
  geom_point(size = 1.5, shape = 17, aes(color = sex))+
  scale_color_manual(values = c("red","blue"))+
  geom_smooth(method = "lm", color = "black", se = TRUE)+
  ggtitle("Gráfico de Dispersión") +
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("BMI")+
  ylab("Charges")+
  facet_grid(.~sex)
dispersion2

################################################################################
############################## GRAFICO DE BOXPLOT ##############################
################################################################################

# 1. Gráfico total
boxplot1 <- ggplot(aes(x = charges), data = df)+
  geom_boxplot(color = "darkblue", fill = "lightblue", size = 0.5)+
  ggtitle("Diagrama de cajas") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  xlab("Charges") 
boxplot1

# 2. Desagregado por variable
boxplot2 <- ggplot(aes(x = charges), data = df) +
  geom_boxplot(aes(color = sex , fill = sex)) + 
  scale_fill_manual(values = c("red","blue")) +
  scale_color_manual(values=c("black","black")) +
  ggtitle("Diagrama de cajas") + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  xlab("Charges") + 
  facet_grid(.~sex) 
boxplot2

################################################################################
############################### GRAFICA DE PASTEL ##############################
################################################################################

# 1. Gráfico total

porc = df%>%
  group_by(region)%>%
  summarise(n = n())%>%
  reframe(region, n, porcentaje = n/sum(n)*100)

pie <- ggplot(data = porc, aes(x = 1, y = porcentaje, fill = region))+
  scale_fill_manual(values = c("red","blue","purple","lightblue"))+
  geom_bar(stat = "identity", color = "black")+
  geom_text(aes(label = paste0(round(porcentaje,1),"%")), position = position_stack(vjust = 0.5))+
  coord_polar(theta = "y")+
  theme_void()+
  ggtitle("Gráfico de Pastel") + 
  theme(plot.title = element_text(hjust = 0.5))
pie

