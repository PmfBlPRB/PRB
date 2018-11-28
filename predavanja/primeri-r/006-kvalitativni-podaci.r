#kvalitativni podaci
painters

prosecna.ocena.kompozicija <-  mean(painters$Composition)
prosecna.ocena.kompozicija

prosecna.ocena.crtanje <-  mean(painters$Drawing)
prosecna.ocena.crtanje

prosecna.ocena.boja <-  mean(painters$Colour)
prosecna.ocena.boja

prosecna.ocena.izrazajnost <-  mean(painters$Expression)
prosecna.ocena.izrazajnost

izrazajnosti <- painters$Expression
izrazajnosti
izrazajnosti.frekfencija <- table(izrazajnosti)
izrazajnosti.frekfencija

skole <- painters$School
skole
skole.frekfencija <- table(skole)
skole.frekfencija

skole <- painters$School
skole
skole.relativna.frekfencija <- table(skole) / length(skole) 
skole.relativna.frekfencija

skole <- painters$School
skole
skole.frekfencija.procenat <- table(skole) / length(skole) * 100
skole.frekfencija.procenat

skole <- painters$School
skole
skole.frekfencija.procenat <- table(skole) / length(skole) * 100
cbind(skole.frekfencija.procenat)

skole <- painters$School
skole
skole.frekfencija.procenat <- table(skole) / length(skole) * 100
skole.frekfencija.procenat
staro.podesavanje <- options(digits=3)
skole.frekfencija.procenat
options(staro.podesavanje)

skole <- painters$School
skole
skole.frekfencija <- table(skole)
barplot( skole.frekfencija)

skole <- painters$School
skole
skole.frekfencija <- table(skole)
boje <- c("red","green", "yellow", "purple", "violet")
barplot( skole.frekfencija,
         col = boje)

ocene.kompozicija <- painters$Composition
ocene.kompozicija.frekfencija <- table (ocene.kompozicija)
boje <- c("red","green", "yellow", "purple", "violet")
barplot(ocene.kompozicija.frekfencija, col = boje)

barplot( table(painters$Composition), 
        col = c("red","green", "yellow", "purple", "violet")
        )

skole <- painters$School
skole
skole.frekfencija <- table(skole)
pie( skole.frekfencija)

pie( table(painters$School))

pie( table(painters$School),
     col = c("red","green", "yellow", "purple", "violet"))

prosecna.ocena.kompozicija.svi <-  mean(painters$Composition)
prosecna.ocena.kompozicija.svi

# prosecna.ocena.kompozicija.skola.A ???
filter.skola.A <- painters$School == "A"
slikari.skola.A <- painters[filter.skola.A,]
ocena.kompozicija.skola.A <- slikari.skola.A$Composition
prosecna.ocena.kompozicija.skola.A <- mean(ocena.kompozicija.skola.A)
prosecna.ocena.kompozicija.skola.A

prosecna.ocena.kompozicija.skola.A <- 
  mean(painters[painters$School == "A",]$Composition)
prosecna.ocena.kompozicija.skola.A

prosecna.ocena.kompozicija.skola.B <- 
  mean(painters[painters$School == "B",]$Composition)
prosecna.ocena.kompozicija.skola.B

sve.prosecne.ocene.kompozicija <- 
  tapply(painters$Composition, painters$School, mean)
sve.prosecne.ocene.kompozicija

sve.prosecne.ocene.boja <- 
  tapply(painters$Colour, painters$School, mean)
sve.prosecne.ocene.boja