library(ggplot2)

eco <- economics
eco_long <- economics_long

ggplot(eco, aes(x = date))+
            geom_line(aes(y = unemploy, color = "unemploy"))
