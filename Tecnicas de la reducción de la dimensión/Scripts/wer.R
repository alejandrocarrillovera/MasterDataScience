ACPTIUSD<- ACPTIUSD[,2:11]

ACPTIUSD<-na.omit(ACPTIUSD)



correlacion <- cor(ACPTIUSD)

corrplot <- corrplot(correlacion, method="number", type="upper")

det(correlacion)

bartlett.test(ACPTIUSD)

correlacionTrain<-corrplot(cor(ACPTIUSD),method = 'number',type = "upper")


KMO(correlacion)

acp<-PCA(ACPTIUSD)

fviz_eig(acp, addlabels = TRUE, hjust = -0.3, barfill = "#00932A", barcolor = "#00932A")+
  labs(title ="Grafico de sedimentacion", x="Dimensiones", y="% Varianza explicada" )+
  theme_bw()

acp$eig #Se generan 8 componetes incorrelados, y con los 2 primeros componentes explicamos el 98.85% de la varianza.
var=get_pca_var(acp)
var
var$coord
round((var$cos2),3)
corrplot(var$cos2)

varimax(acp$var$cos2)

acp$var$cos2
