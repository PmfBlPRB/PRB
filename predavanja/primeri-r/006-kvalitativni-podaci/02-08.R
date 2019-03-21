## Faza 1
faithful
head(faithful, n=15)
tail(faithful, n=15)

## Faza 2
faithful$eruptions
min(faithful$eruptions)
max(faithful$eruptions)
# alternativno
range(faithful$eruptions)

## Faza 3
granice <- c(1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5)
# alternativno
granice <- seq(1.5,5.5, 0.5)
granice

## Faza 4
granice <- seq(1.5,5.5, 0.5)
pripadnost <- cut(faithful$eruptions, 
                  granice,
                  right=FALSE)
pripadnost

## Faza 5
granice <- seq(1.5,5.5, 0.5)
pripadnost <- cut(faithful$eruptions, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
broj.po.intervalu
#alternativno
table(cut(faithful$eruptions, 
          seq(1.5,5.5, 0.5),
          right=FALSE))

## Faza 6
granice <- seq(1.5,5.5, 0.5)
pripadnost <- cut(faithful$eruptions, 
                  granice,
                  right=FALSE)
broj.po.intervalu <- table(pripadnost)
cbind(broj.po.intervalu)








