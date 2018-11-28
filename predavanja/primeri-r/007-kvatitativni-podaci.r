# Kvantitativni podaci

trajanje.posmatranja <- sum(faithful$eruptions) + sum(faithful$waiting)
trajanje.posmatranja
trajanje.posmatranja <- trajanje.posmatranja / c(60, 60*24, 60*24*7)
trajanje.posmatranja

trajanja <- faithful$eruptions
trajanja
opseg <- range(trajanja)
opseg
# alternativni nacin
opseg <- c( min(trajanja), max(trajanja))
opseg
donja.granica <- 1.5
gornja.granica <- 5.5
broj.podintervala <- 25
granice <- seq(donja.granica,
               gornja.granica, 
               (gornja.granica-donja.granica)/broj.podintervala )
granice
izrezano <- cut(trajanja, granice, right=FALSE)
izrezano
frekfencija.trajanja <- table(izrezano)
barplot(frekfencija.trajanja)

cekanja <- faithful$waiting
opseg <- c( min(cekanja), max(cekanja))
donja.granica <- 45
gornja.granica <- 100
broj.podintervala <- 125
granice <- seq(donja.granica,
               gornja.granica, 
               (gornja.granica-donja.granica)/broj.podintervala )
izrezano <- cut(cekanja, granice, right=FALSE)
barplot(table(izrezano))

trajanja <- faithful$eruptions
hist(trajanja, right = FALSE)
hist(trajanja, breaks = 20, right = FALSE)
hist(trajanja, 
     breaks = c(1.5, 2, 2.5, 3, 4.7, 5, 5.5), 
     right = FALSE)
hist(trajanja, 
     breaks = c(1.5, 2, 2.5, 3, 4.7, 5, 5.5), 
     main = "Histogram za trajanje",
     xlab = "trajanje erupcije",
     col = c( "purple", "red", "blue"),
     right = FALSE)

cekanja <- faithful$waiting
hist(cekanja, 
     breaks = 5, 
     col = c( "purple", "red", "blue"),
     right = FALSE)

trajanja <- faithful$eruptions
donja.granica <- 1.5
gornja.granica <- 5.5
broj.podintervala <- 10
granice <- seq(donja.granica,
               gornja.granica, 
               (gornja.granica-donja.granica)/broj.podintervala )
izrezano <- cut(trajanja, granice, right=FALSE)
frekfencija.trajanja <- table(izrezano)
frekfencija.trajanja
relativna.frekfencija.trajanja <- frekfencija.trajanja / nrow(faithful)
relativna.frekfencija.trajanja
relativna.frekfencija.trajanja <- frekfencija.trajanja / length(trajanja)
relativna.frekfencija.trajanja
relativna.frekfencija.trajanja <- frekfencija.trajanja / sum(frekfencija.trajanja)
relativna.frekfencija.trajanja 

trajanja <- faithful$eruptions
donja.granica <- 1.5
gornja.granica <- 5.5
broj.podintervala <- 10
granice <- seq(donja.granica,
               gornja.granica, 
               (gornja.granica-donja.granica)/broj.podintervala )
izrezano <- cut(trajanja, granice, right=FALSE)
frekfencija.trajanja <- table(izrezano)
frekfencija.trajanja
kumulativna.frekfencija.trajanja <- cumsum(frekfencija.trajanja)
kumulativna.frekfencija.trajanja

cekanja <- faithful$waiting
donja.granica <- 45
gornja.granica <- 100
broj.podintervala <- 15
granice <- seq(donja.granica,
               gornja.granica, 
               (gornja.granica-donja.granica)/broj.podintervala )
frekfencija.cekanja <- table(cut(cekanja, granice, right=FALSE))
frekfencija.cekanja
kumulativna.frekfencija.cekanja <- cumsum(frekfencija.cekanja)
kumulativna.frekfencija.cekanja

trajanja <- faithful$eruptions
donja.granica <- 1.5
gornja.granica <- 5.5
broj.podintervala <- 10
granice <- seq(donja.granica,
               gornja.granica, 
               (gornja.granica-donja.granica)/broj.podintervala )
izrezano <- cut(trajanja, granice, right=FALSE)
frekfencija.trajanja <- table(izrezano)
kumulativna.frekfencija.trajanja <- cumsum(frekfencija.trajanja)
kumulativna.frekfencija.trajanja
plot(granice,c(0, kumulativna.frekfencija.trajanja) )
lines(granice,c(0, kumulativna.frekfencija.trajanja) )

cekanja <- faithful$waiting
donja.granica <- 40
gornja.granica <- 110
broj.podintervala <- 45
granice <- seq(donja.granica,
               gornja.granica, 
               (gornja.granica-donja.granica)/broj.podintervala )
relativna.frekfencija.cekanja <- 
  table(cut(cekanja, granice, right=FALSE))/ length(cekanja)
kumulativna.relativna.frekfencija.cekanja <- cumsum(relativna.frekfencija.cekanja)
kumulativna.relativna.frekfencija.cekanja
plot(granice,c(0, kumulativna.relativna.frekfencija.cekanja), 
     xlab="cekanje(u minutama)",
     ylab="deo populacije")
lines(granice,c(0, kumulativna.relativna.frekfencija.cekanja) )

donja.granica <- -4
gornja.granica <- 4
broj.tacaka <- 40
x <- seq(donja.granica, gornja.granica, 
         by = (gornja.granica-donja.granica)/broj.tacaka )
y <- sin (x)
plot(x,y)
lines(x,y)

trajanja <- faithful$eruptions
cekanja <- faithful$waiting
plot( trajanja, cekanja, xlab="trajanje", ylab= "cekanje")
model <- lm(cekanja ~ trajanja )
abline(model)

trajanja <- faithful$eruptions
cekanja <- faithful$waiting
plot(  cekanja, trajanja, xlab="cekanje", ylab= "trajanje")
model <- lm( trajanja ~ cekanja )
abline(model)
