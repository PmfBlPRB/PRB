# Faza 1
granice <- seq(40,100, 5)
pripadnost <- cut(faithful$waiting, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
kumul.broj.po.intervalu <- cumsum(broj.po.intervalu)
kumul.broj.po.intervalu 

#Faza 2
granice <- seq(40,100, 5)
pripadnost <- cut(faithful$waiting, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
kumul.broj.po.intervalu <- cumsum(broj.po.intervalu)
barplot(kumul.broj.po.intervalu)

#Faza 3
granice <- seq(40,100, 2)
pripadnost <- cut(faithful$waiting, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
kumul.broj.po.intervalu <- cumsum(broj.po.intervalu)
plot( granice, c(0, kumul.broj.po.intervalu))
lines(granice, c(0, kumul.broj.po.intervalu))
