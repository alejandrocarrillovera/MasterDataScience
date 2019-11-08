

ggplot(eco, aes(x = date))+
  geom_line(aes(y = pce ,color = "pce"))+
  geom_line(aes(y = pop ,color = "pop"))+
  geom_line(aes(y = psavert ,color = "psavert" ))+
  geom_line(aes(y = uempmed ,color = "uempmed" ))+
  geom_line(aes(y = unemploy,,color = "unemploy"))

ggplot(eco_long, aes(x = date , y = value01))+
  geom_line(aes(color = variable))
