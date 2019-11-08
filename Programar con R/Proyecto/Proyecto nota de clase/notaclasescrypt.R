minota <-function (a, p, e){
  nota<- a*0.1 + p*0.4 + e*0.5
  if (e<5)
    return(min(4,nota))
  else
    return(nota)
}
nombres<-c("Maria","Marta","Javier","Alvaro","Beltran")
nota_calculada<-c(4.5,6,7.3,2.5,5.6)
nota_definitiva<-c(4,4,7.3,2.5,4)
notas_alumnos<-data.frame(nombres,nota_calculada,nota_definitiva)
  
no_superan<-function(notas_alumnos){
  p=0
  nombres_suspensos<-c()
  for(i in 1:length(notas_alumnos$nombres)){
    if(nota_calculada[i]!=nota_definitiva[i]|nota_definitiva[i]<5){
        p=p+1
        nombres_suspensos<-append(nombres_suspensos, nombres[i])
    }
  }
  print(p)
  print(as.character(nombres_suspensos))
}
no_superan(notas_alumnos)
