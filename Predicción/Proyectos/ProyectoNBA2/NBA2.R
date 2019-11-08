#Libreria utilizada

library(ggplot2)
library(leaps)
library(rsample)  
library(glmnet)   
library(dplyr)    
library(caret)
library(ISLR)
library(MASS)
library(glmnet)

#Cargamos base de datos

nba <- read.csv("nba.csv")
nba <- na.omit(nba)

#Calculamos los coeficientes de la regresión excluyendo las variables jugador, pais y equipo
#ya que no las considero relevantes a la hora de explicar el salario
coef(lm(Salary ~.-Player-NBA_Country-Tm, data = nba))

#Calculamos una regresión a través del método backward
mejores_mod <- regsubsets(Salary~.-Player-NBA_Country-Tm, data = nba, nvmax = 25, method = "backward")
summary(mejores_mod)

names(summary(mejores_mod))
summary(mejores_mod)$adjr2
which.max(summary(mejores_mod)$adjr2)
#El mayor valor de R2 es el 12
coef(object = mejores_mod, 12)

#Dibujamos el R2 ajustado y vemos que como nos había mostrado antes, el mayor valor es en el predictor 12
p <- ggplot(data = data.frame(Predictores = 1:25,
                              R2_ajustado = summary(mejores_mod)$adjr2),
            aes(x = Predictores, y = R2_ajustado)) +
  geom_line() +
  geom_point()

p <- p + geom_point(aes(
  x = Predictores[which.max(summary(mejores_mod)$adjr2)],
  y = R2_ajustado[which.max(summary(mejores_mod)$adjr2)]),
  colour = "red", size = 3)
p <- p +  scale_x_continuous(breaks = c(0:24)) + 
  theme_bw() +
  labs(title = 'R2 ajustado', 
       x =  'nº predictores')
p


#CROSS VALIDATION - VALIDATION SET 

set.seed(250)
train <- sample(x = 1:483, size = 97, replace = FALSE)


mejor_mod <- regsubsets(Salary~.-Player-NBA_Country-Tm, data = nba[train,], nvmax = 25, method = "backward")
mejor_mod

Error_val <- rep(NA, 24)
test_matrix <- model.matrix(Salary~.-Player-NBA_Country-Tm, data = nba[-train, ])


for (i in 1:24) {
  coeficientes <- coef(object = mejor_mod, id = i)
  predictores <- test_matrix[, names(coeficientes)]
  predicciones <- predictores %*% coeficientes
  Error_val[i] <- mean((nba$Salary[-train] - predicciones)^2)
}

which.min(Error_val)
sqrt(Error_val[2])
Error_val
#El minimo error sale en el predictor 2

q <- ggplot(data = data.frame(n_predictores = 1:24,
                              Estimacion_MSE = Error_val),
            aes(x = n_predictores, y = Estimacion_MSE)) +
  geom_line() +
  geom_point()

q <- q + geom_point(aes(x = n_predictores[which.min(Error_val)], 
                        y = Error_val[which.min(Error_val)]),
                    colour = "red", size = 3)

q <- q +  scale_x_continuous(breaks = c(0:24)) + 
  theme_bw() +
  labs(title = 'validacion MSE',
       x =  'nº predictores')
q

#Dibujamos la validación por MSE dandonos dos
mejor_mod1 <- regsubsets(Salary~.-Player-NBA_Country-Tm, data = nba[train,], nvmax = 25, method = "backward")

coef(object = mejor_mod1, id = 2)



#ELASTIC NET

set.seed(250)
nba_split <- initial_split(nba, prop = .80, strata = "Salary")
nba_train <- training(nba_split)
nba_test  <- testing(nba_split)

nba_train_x <- model.matrix(Salary ~ .,nba_train)[, -1]
nba_train_y <- nba_train$Salary


nba_test_x <- model.matrix(Salary ~ ., nba_test)[, -1]
nba_test_y <- nba_test$Salary


train_control <- trainControl(method = "cv", number = 10)

caret_mod <- train(
  x = nba_train_x,
  y = nba_train_y,
  method = "glmnet",
  preProc = c("center", "scale", "zv", "nzv"),
  trControl = train_control,
  tuneLength = 10
)


caret_mod
#Elegimos alpha 1 por lo que pasaríamos a hacer un LASSO

cv_lasso <- cv.glmnet(x = nba_train_x, y = nba_train_y, alpha = 0.7)
min(cv_lasso$cvm)

pred <- predict(cv_lasso,s=cv_lasso$lambda.min,nba_test_x)
mean((nba_test_y-  pred)^2)

sqrt(2.732014e+13)

plot(cv_lasso, xvar = "lambda", label = TRUE)

#El error resultante es de un poco más de 5 millones