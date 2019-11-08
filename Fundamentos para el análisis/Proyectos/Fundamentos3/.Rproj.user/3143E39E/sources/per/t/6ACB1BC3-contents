#PRACTICA 3
#Librerias
library(mosaicCalc)
library(mosaic)

#Exercise 1
#Apartado A
a <- mosaicCalc::D(3*x^2 - 2*x + 4 ~ x)
a(0)
#La derivada de a con x=0 es de -2
#Apartado B
plotFun(a, x.lim=range(0,10)) 
#B.A positive sloping line

#Exercise 2
#Apartado A
b <- mosaicCalc::D(5*exp(.2*x) ~ x)
b(0)
#La derivada de b con x=0 es de 1
#Apartado B
plotFun(b, x.lim=range(0,10)) 
plotFun(5*exp(.2*x)~ x, x.lim=range(0,10)) 
#B. Same exponential shape, but different initial values

#Exercise 3
c <- makeFun(exp(-(x^2)) ~ x)
plotFun(c(x)~x,x.lim=range(-2,2)) 
#A. A bell-shaped mountain

#Exercise 4
d <- mosaicCalc::D(fred^2 ~ ginger)
d
#A. 0 everywhere

#Exercise 5
#Primera derivada

deriv_e <- mosaicCalc::D(cos(2*t)~t)
deriv_e

#Segunda derivada
second_deriv_e <- mosaicCalc::D(deriv_e(t) ~t) 
second_deriv_e

#Tercera derivada
third_deriv_e <- mosaicCalc::D(second_deriv_e(t)~t ) 
third_deriv_e
#D. 8 sin(2t)

#Cuarta derivada
fourth_deriv_e <- mosaicCalc::D(third_deriv_e(t)~t ) #Cuarta derivada
fourth_deriv_e
#E. 16 cos(2*t)

#Exercise 6
#Apartado A
#Primera derivada
deriv_f <- mosaicCalc::D(cos(2*t^2)~t) 
deriv_f

#Segunda derivada
second_deriv_f <- mosaicCalc::D(deriv_f(t) ~t) 
second_deriv_f

#Tercera derivada
third_deriv_f <- mosaicCalc::D(second_deriv_f(t)~t ) 
third_deriv_f

#Cuarta derivada
fourth_deriv_f <- mosaicCalc::D(third_deriv_f(t)~t ) #Cuarta derivada
fourth_deriv_f
plotFun(fourth_deriv_f, x.lim=range(0,5)) 

#C. A cosine whose amplitude increases and whose period decreases as t gets bigger

#Apartado B
#A. sin and cos functions

#Exercise 7
#Derivada parcial
px <- mosaicCalc::D(x*sin(y) ~ x )
py <- mosaicCalc::D(x*sin(y) ~ y )
px
py
#La derivada parcial respecto de x es diferente respecto de y, por lo que la afirmación es FALSA

#Segunda derivada parcial
pxx <- mosaicCalc::D(x*sin(y) ~ x&x )
pyy <- mosaicCalc::D(x*sin(y) ~ y&y )
pxx
pyy
#Vuelven a ser diferentes, la afirmación es FALSA

#Derivadas parciales cruzdas.
pxy <- mosaicCalc::D(x*sin(y) ~ x & y)
pyx <- mosaicCalc::D(x*sin(y) ~ y & x)
pxy
pyx
#Tienen el mismo resultado por lo tanto la afirmación es VERDADERA