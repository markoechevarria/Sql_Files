################################################################################
########################## MODELO DE REGRESION LINEAL ##########################
################################################################################
library(ggplot2)

# 1. Se crea una base con las variables años de experiencia y salario.
anios = c(0,5,10,15,20,25,30)
salario = c(1000,5000,7000,6000,13000,12000,17000)
df = data.frame("Experiencia" = anios, "Salario" = salario)
head(df)

# 2. Vemos de forma gráfica la relación entre las variables
graf1 = ggplot(aes(x = Experiencia, y = Salario), data = df)+
  geom_point()+
  geom_smooth(method = "lm", color = "red", se = TRUE)
graf1

# 3. Calculamos los coeficientes (Formulas específicas)
num = sum(df$Experiencia*df$Salario)-(sum(df$Experiencia)*sum(df$Salario))/dim(df)[1] 
den = sum(df$Experiencia**2)-(sum(df$Experiencia)**2)/dim(df)[1]
b1 = num/den
b0 = mean(df$Salario)-b1*mean(df$Experiencia)

# 4. Calculamos los coeficientes (Fórmula General)
x = cbind(1,df$Experiencia)
y = df$Salario
betas = solve(t(x)%*%x)%*%t(x)%*%y

# 5. Calculamos los valores predichos
y_pred = x%*%betas
y_pred

# 5. Calculamos la bondad de ajuste
SCR = sum((y_pred-mean(y))**2)
SCT = sum((y-mean(y))**2)
SCE = sum((y-y_pred)**2)
R2 = 1-(SCE/SCT)
R2

# 6. Calculamos los indicadores de error
RMSE = sqrt(sum((y-y_pred)**2)/length(y))
MAE = sum(abs(y-y_pred))/length(y)
