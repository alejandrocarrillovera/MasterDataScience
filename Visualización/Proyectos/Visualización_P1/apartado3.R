faith <- faithful
ggplot(faith, aes(x = eruptions, y = waiting))+
  geom_point(aes(color = eruptions))
