ggplot(faith, aes(x = eruptions, y = waiting))+
  geom_point(aes(color = eruptions))+
  geom_jitter()
