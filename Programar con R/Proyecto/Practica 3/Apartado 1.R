#ESCRIBIR UNA FUNCION QUE CALCULE N TERNAS PITAGORICAS PROCEDENTES DE UNA 4-SECUENCIA DE LA SERIE DE FIBONACCI. SE VALORARA ESCRIBIR UNA FUNCION ADICIONAL QUE CALCULE NUMEROS DE FIBONACCI
#PRIMERO CALCULAMOS UNA FUNCION QUE HAGA LA SUCESION DE FIBONACCI
fib<-function(n){
  if(n<3){
    t<-seq(0,n)
    return(t[1:n])}
    else{
      m<-c(0,1)
    for(i in 3:n){
      m[i]<-m[i-1]+m[i-2]
    }
    return(m)
  }
}
fib(10)
#ESCRIBIMOS LA FUNCION QUE CALCULA N TERNAS PITAGORICAS QUE PROCEDEN DE UNA 4-SECUENCIA DE LA SERIA DE FIBONACCI
nternas<-function(n){
  fibo<-c(fib(n+4))
  p<-matrix(nrow=n,ncol=3)
  for (i in 1:n) {
    v1<-fibo[i+1]
    v2<-fibo[i+2]
    v3<-fibo[i+3]
    v4<-fibo[i+4]
    a<-v1*v4
    b<-2*v2*v3
    h<-v2*v2+v3*v3
    p[i,]<-c(a,b,h)
  }
  print(p)
}
nternas(10)
