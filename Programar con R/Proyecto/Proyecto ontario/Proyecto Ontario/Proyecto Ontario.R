#MALES
males<-read.csv("ontario_top_baby_names_male_1917-2016_english.csv")

getwd()
head(males)
tail(males)
str(males)
max(males$Year)
nombresmalesrecientes<-males[males$Year==max(males$Year),]
nrow(nombresmalesrecientes)
sum(nombresmalesrecientes$Frequency)
nombresmalesrecientes<-nombresmalesrecientes[,c("Name","Frequency")]
nombresmalesrecientes<-nombresmalesrecientes[order(nombresmalesrecientes$Frequency, decreasing = TRUE),]
nombresmalesrecientes
write.csv(nombresmalesrecientes,file="2016_male_popular.csv")

#nombre deseado
#nombredeseadomale<-readline(prompt = "¿Que nombre quieres buscar? :")
nombredeseadomale<-"lucas"
freq.year<-males[males$Name==toupper(nombredeseadomale),c("Year","Frequency")]
freq.year

#Dibujar el nombre deseado
plot.title<-paste("Bebes llamados",toupper(nombredeseadomale))
g<-plot(freq.year, main=plot.title, type='s')
