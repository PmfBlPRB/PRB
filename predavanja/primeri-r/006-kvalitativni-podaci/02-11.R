granice <- seq(40,100, 5)
pripadnost <- cut(faithful$waiting, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
relativno.ucesce <- broj.po.intervalu/nrow(faithful)
relativno.ucesce

# alternativno
granice <- seq(40,100, 5)
pripadnost <- cut(faithful$waiting, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
relativno.ucesce <- broj.po.intervalu / sum(broj.po.intervalu)
relativno.ucesce
