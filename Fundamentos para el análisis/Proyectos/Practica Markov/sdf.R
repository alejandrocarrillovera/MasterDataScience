#EJERCICIO 1
library("markovchain")
empresas<-c("A","B","C")
byRow<-TRUE
cm <- matrix(data = c(630/700,28/700,42/700,105/750,570/750,75/750,55/550,44/550,451/550), byrow = byRow,
             nrow = 3,dimnames = list(empresas, empresas))
cmempresas <- new("markovchain", states =empresas, byrow = byRow,
               transitionMatrix = cm, name = "empresas")
plot(cmempresas)
s_inicial<-c(700/2000,750/2000,550/2000)
s_inicial
s_marzo<- s_inicial*cmempresas
s_marzo
s_mayo<-s_inicial*cmempresas*cmempresas*cmempresas
s_mayo
s_agosto<-s_inicial*(cmempresas^6)
s_agosto
steadyStates(cmempresas)
#EJERCICIO 2

