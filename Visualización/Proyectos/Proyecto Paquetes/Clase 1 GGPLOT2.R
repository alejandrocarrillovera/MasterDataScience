#
# Unicode: UTF8 Hay que utilizar este
#File, reopen con encouding y se utiliza ese UTF8 

library(ggplot2)
#Para no cargar la libreria entera: ggplot2:: lo que sea
ggplot2::aes()
#datasets
mpg
mtcars


ggplot(mpg,aes(x = class, y = displ)) + geom_point()

ggplot(mpg,aes(x = cty, y = displ, size = hwy, color = class)) + geom_point()

ggplot(mpg,aes(x = cty))+
         geom_bar(fill = "grey")+
         geom_point(aes(y = displ, color = class, size = hwy))


hola <- ggplot(mpg,aes(x = cty))+
  geom_bar(fill = "grey")+
  geom_point(aes(y = displ, color = class, size = hwy))

ggplot(mpg,aes(x=cty,y=displ))+
         geom_point()+
      facet_grid(.~year)+
  theme_bw()

#Estadistica, ggplot2 y variables
base <- ggplot(mpg,aes(x=cty,y=displ))

ggplot(mpg,aes(x=cty,y=displ))+
  geom_density2d()

ggplot(mpg,aes(x=cty,y=displ))+
  geom_hex()

mi_grafica <- base + geom_hex()+facet_grid(.~year)+
  theme_bw()

base + 
  stat_smooth() #regresion

base + 
  stat_smooth(method = "lm")

##Plot.ly
library(plotly)
ggplotly(hola)

