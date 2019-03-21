range(faithful$waiting)

granice <- seq(40,100, 5)
pripadnost <- cut(faithful$waiting, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
broj.po.intervalu

barplot(broj.po.intervalu)