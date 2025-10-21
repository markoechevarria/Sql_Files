######################################################
################ Importamos la base ##################
######################################################
library(openxlsx)
path = "D:/1. Briam/3. Modulos Dictados - GEM/6. Estadística y Análisis de Datos con R Studio/Inputs"
df = read.xlsx(file.path(path,"encuesta.xlsx"), sheet = "SAT_HOSP")

######################################################
################# 1. Confiabilidad ###################
######################################################
library(psych)
psych::alpha(df[,6:13])

# El instrumento es confiable ya que el alfa de cronbach
# es superior al 70%.

######################################################
#################### 2. Validez ######################
######################################################

############ Supuestos del AFE: Linealidad ###########
library(psych)
psych::pairs.panels(df[,6:13], method = "pearson")

# Conclusión: Según los gráficos no se puede corroborar 
# el cumplimiento del supuesto de linealidad.

# De forma uno a uno:
# Ho: Corr(X,Y) = 0   H1: Corr(X,Y) != 0
for (i in colnames(df[,6:13])){
  for (j in colnames(df[,6:13])){
    if (i>j) {
      print(paste0("Variables evaluadas: ",i,"-",j))
      res = cor.test(as.matrix(df[i]),as.matrix(df[j]))
      print(res$p.value)
    }
  }
}

# Conclusión: Se cumple con el supuesto de linealidad.

####### Supuestos del AFE: Normalidad univariada ######
psych::describe(df[,6:13])

# Conclusión: Como el coeficiente de asimetría es menor que 2
# y el coeficiente de curtosis menor que 7, se cumple con el
# supueto de normalidad univariada.

####### Supuestos del AFE: Normalidad multivariada ######
psych::mardia(df[,6:13], na.rm = TRUE, plot = TRUE)

# Conclusión: Como el coeficiente de curstosis es superior
# a 5, no se cumple con el supuesto de normalidad multivariada.

############ Correlación Policórica ###########
res = psych::polychoric(df[,6:13])
mat_corr_pol = res$rho

# Tomando en cuenta la escala ordinal (Escala Likert) y que no
# se cumplen los supuesto de linealidad y normalidad multivariada,
# no resulta apropiado utilizar correlaciones de pearson, en vez
# se deberán usar correlaciones policóricas.

###### ¿Será válido utilizar el análisis factorial? ######
library(qgraph)
qgraph::qgraph(mat_corr_pol, cut = 0.3, details = TRUE,
               posCol = "darkgreen", negCol = "red",
               labels = names(df[,6:13]))
psych::KMO(mat_corr_pol)
# Conclusión: Existe una correlación fuerte entre las 
# variables; por lo tanto, es posible realizar el
# análisis factorial.

################ ¿Cuántos factores retener? ##############

# 1. Scree Plot
psych::scree(df[,6:13], pc = TRUE, fa = FALSE, hline = -1)

# 2. Parallel Analysis
psych::fa.parallel(df[,6:13], fa = "pc", n.iter = 500, ylabel = "Eingenvalues")

# 3. Network Graph
library(EGAnet)
EGAnet::EGA(mat_corr_pol, n = 686, plot.EGA = TRUE)

################ Análisis Factorial Exploratorio ##############
# PROMAX: Rotación Oblicua (Asume que los factores están relacionados)
# SMC: Colocamos TRUE para que nos calcule las comunalidades.
# FM: Seleccionamos el método Principal Axis ("PA") que es recomendable
# cuando no se cumple el supuesto de normalidad multivariada.

un_factor = psych::fa(mat_corr_pol, nfactors = 1, 
                      rotate = "promax",SMC = TRUE, 
                      fm = "pa", n.obs = 686)

print(un_factor, sort = TRUE, cut = 0, digits = 3)

dos_factor = psych::fa(mat_corr_pol, nfactors = 2, 
                       rotate = "promax", SMC = TRUE, 
                       fm = "pa", n.obs = 686)

print(dos_factor, sort = TRUE, cut = 0, digits = 3)

tres_factor = psych::fa(mat_corr_pol, nfactors = 3, 
                       rotate = "promax",SMC = TRUE, 
                       fm = "pa", n.obs = 686)

print(tres_factor, sort = TRUE, cut = 0, digits = 3)
