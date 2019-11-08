#CARGAMOS LA BASE DE DATOS DE LAS CALIFICACIONES DE ECO 2019
calificaciones<-read.csv2(file="C:/Users/alexi/Desktop/Proyectos en R/Practica 3/calificaciones.csv",header=TRUE,sep=";")
calificaciones<-data.frame(calificaciones)
#A. CUANTOS ALUMNOS HAY EN TOTAL Y LA NOTA MEDIA EN EL EXAMEN FINAL SIN CONSIDERAR LOS NP
#CUANTOS ALUMNOS HAY
nrow(calificaciones)
#NOTA MEDIA EN EL EXAMEN FINAL SIN CONSIDERAR LOS NP
mean(calificaciones$Ex..JUNIO.12P, na.rm=TRUE)*10/12

#B. NOMBRE DE LOS QUE HAN APROBADO EL EXAMEN FINAL A PESAR DE HABER ASISTIDO MENOS DE UN 50% A LAS CLASES
naprobados<-function(calificaciones){
  p=0
  nombres<-c()
  for (i in 1:length(calificaciones)) {
    if(calificaciones$Ex..JUNIO.12P[i]>6 & calificaciones$Asistencia..1P[i]<0.5){
      p=p+1
      nombres<-append(nombres,calificaciones$NOMBRE.ALUMNO[i])
    }
  }
  print(p)
  print(as.character(nombres))
}
naprobados(calificaciones)

#C. COMPLETA LA COLUMNA DE CALIFICACION CON: APROBADO(5-6.9), NOTABLE(7-8.9), SOBRESALIENTE(9-10).
calificacion<-function(calificaciones){
  for(i in 1:length(calificaciones$`NOMBRE ALUMNO`)){
    if(calificaciones$Nota_FINAL[i]>5&calificaciones$Nota_FINAL[i]<=6.9)
      calificaciones$CALIFICACION[i]<-"Aprobado"
    if(calificaciones$Nota_FINAL[i]>7&calificaciones$Nota_FINAL[i]<=8.9)
      calificaciones$CALIFICACION[i]<-"Notable"
    if(calificaciones$Nota_FINAL[i]>=9)
      calificaciones$CALIFICACION[i]<-"Sobresaliente"
    if(calificaciones$Nota_FINAL[i]<5|calificaciones$Nota_FINAL=NA)
      calificaciones$CALIFICACION[i]<-"Suspenso"
  }
}

#D. GUARDA LA TABLA MODIFICADA EN EL PROYECTO PRACTICA3 CON EL NOMBRE CALIFICACIONES2019.CSV
write.csv(calificaciones, file =  "Calificaciones2019.csv", row.names = FALSE)
