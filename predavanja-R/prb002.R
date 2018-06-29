
########################################################
# Kvalitativni podaci 
########################################################
# Prikaz okvira sa podacima
library(MASS)
painters

# Prikaz jedne kolone u okviru sa podacima
library(MASS)
painters$School

# Koriscenje help-a za okvir sa podacima
help(painters)

########################################################
# Raspodela frekfencija za kvalitativne podactke 
########################################################
# Prikaz raspodele frekvencija za kolonu School okvira sa 
# podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
skola.frekvencije

# Poboljsan prikaz raspodele frekvencija za kolonu School 
# okvira sa podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
cbind(skola.frekvencije)

# Prikaz raspodele frekvencija za kolonu Drawing okvira sa 
# podacima painters
library(MASS)
crtanje <- painters$Drawing
crtanje.frekvencije <- table(crtanje)
crtanje.frekvencije
class(crtanje.frekvencije)

# Poboljsan prikaz raspodele frekvencija za kolonu Drawing 
# okvira sa podacima painters
library(MASS)
crtanje <- painters$Drawing
crtanje.frekvencije <- table(crtanje)
cbind(crtanje.frekvencije)

########################################################
# Raspodela relativnih frekfencija za kvalitativne podatke 
########################################################
# Prikaz raspodele relativnih frekvencija za kolonu School 
# okvira sa podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
skola.frekvencije
skola.relativne.frekvencije <- skola.frekvencije / nrow(painters)
skola.relativne.frekvencije

# Prikaz raspodele relativnih frekvencija za kolonu School 
# okvira sa podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
skola.frekvencije
skola.relativne.frekvencije <- skola.frekvencije / sum(skola.frekvencije)
skola.relativne.frekvencije

# Poboljsan prikaz raspodele relativnih frekvencija za 
# kolonu School okvira sa podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
skola.relativne.frekvencije <- skola.frekvencije / sum(skola.frekvencije)
staro <- options(digits=2)
skola.relativne.frekvencije
options(staro)

# Poboljsan kolonski prikaz raspodele relativnih frekvencija za 
# kolonu School okvira sa podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
skola.relativne.frekvencije <- skola.frekvencije / sum(skola.frekvencije)
staro <- options(digits=1)
cbind(skola.relativne.frekvencije)
options(staro)

########################################################
# Stubicasti dijagram (Bar graph) 
########################################################
# Stubicasti dijagram za frekvenciju kolone School okvira sa 
# podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
barplot(skola.frekvencije)

# Poboljsan stubicasti dijagram frekvencija za kolonu School 
# okvira sa podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
boje <- c("green", "purple", "cyan", "black", "blue", "red", "pink", "yellow")
barplot(skola.frekvencije, col=boje)

########################################################
# Kruzni dijagram (Pie chart) 
########################################################
# Kruzni dijagram za frekvenciju kolone School okvira sa 
# podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
pie(skola.frekvencije)

# Poboljsan Kruzni dijagram za frekvenciju kolone School 
# okvira sa podacima painters
library(MASS)
skola <- painters$School
skola.frekvencije <- table(skola)
boje <- c("green", "purple", "cyan", "black", "blue", "red", "pink", "yellow")
pie(skola.frekvencije, col=boje)


########################################################
# Statistika po kategorijama 
########################################################
# Sredina uzorka za vrednosti kolone Composition okvira 
# sa podacima painters
library(MASS)
mean(painters$Composition)

# Sredina uzorka za vrednosti kolone Composition okvira sa 
# podacima painters kod kojih je vrednost za School == "C" 
library(MASS)
skola <- painters$School
skola.je.C <- skola == "C"
slikari.skole.C <- painters[skola.je.C, ]
mean(slikari.skole.C$Composition)

# Odredjivanje sredine za ocenu Composition za svaku od skola
# unutar okvira sa podacima painters
# (opstije resenje)
library(MASS)
kompozicija <- painters$Composition
kompozicija
skola <- painters$School
skola
tapply(kompozicija, skola, mean)

########################################################
# Kvantitativni podaci 
########################################################
# Okvir sa podacima faithful
faithful
help(faithful)
head(faithful)

########################################################
# Raspodela frekfencija za kvantitativne podatke 
########################################################
# Odrediti raspodelu frekfencija za trajanje erupcija
trajanje <- faithful$eruptions
opseg <- range(trajanje)
opseg
# Napraviti podintervale sa granicama tako da pokrivaju ceo opseg 
granice <- seq(1.5, 5.5, by=0.5)
granice
# Klasifikovati trajanja po podintervalima 
# (podintervali nisu zatvoreni sa desne strane)
trajanje.rez = cut(trajanje, granice, right=FALSE)
# Odredi frekfenciju trajanja
trajanje.frekvencija = table(trajanje.rez)
trajanje.frekvencija
# Dobijeni rezulat se moze prikazati u dve kolone
cbind(trajanje.frekvencija)

########################################################
# Histogram 
########################################################
# Prikazati histogram koji opisuje trajanje erupcija
trajanje <- faithful$eruptions
hist(trajanje, right= FALSE)

# Prikazati "bogatiji" histogram za trajanje erupcija
trajanje <- faithful$eruptions
boje = c("red", "yellow","green","violet", "orange",
         "blue", "pink", "cyan")
hist(trajanje, right=FALSE, col=boje,
     main="Raspodela trajanja erupcije",
     xlab="Trajanje (min.)",
     ylab="Broj ponavljanja")

########################################################
# Relativna raspodela frekfencija za kvantitativne podatke
########################################################
# Odrediti relativnu raspodelu frekfencija za trajanje erupcija
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.relativna.frekvencija <- trajanje.frekvencija / nrow(faithful)
trajanje.relativna.frekvencija

# Alternativno 2 racunanje relativne raspodele frekfencija za trajanje erupcija
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.relativna.frekvencija <- trajanje.frekvencija / length(trajanje)
trajanje.relativna.frekvencija

# Alternativno 3 racunanje relativne raspodele frekfencija za trajanje erupcija
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.relativna.frekvencija <- trajanje.frekvencija / sum(trajanje.frekvencija)
trajanje.relativna.frekvencija

# Racunanje relativne raspodele frekfencija za trajanje erupcija
# i prikaz dobijenih rezulata na manjem broju decimala
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.relativna.frekvencija <- trajanje.frekvencija / sum(trajanje.frekvencija)
trajanje.relativna.frekvencija
staro.stanje <- options(digits=1)
trajanje.relativna.frekvencija
options(staro.stanje)

########################################################
# Raspodela kumulativnih frekfencija 
########################################################
# Odrediti raspodelu kumulativnih frekfencija za trajanje erupcija
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.kumulativna.frekvencija <- cumsum(trajanje.frekvencija)
trajanje.kumulativna.frekvencija

# Odrediti raspodelu kumulativnih frekfencija za trajanje erupcija
# i prikazati je u formatu kolona
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.kumulativna.frekvencija <- cumsum(trajanje.frekvencija)
cbind(trajanje.kumulativna.frekvencija)

########################################################
# Dijagrami
########################################################

# Oformiti dijagram za linearnu funkciju
x <- seq(1, 20, by=0.3)
y <- (3/4)*x+2
plot(x,y)

# Oformiti dijagram za kvadratnu funkciju
x <- seq(-20, 20, by=0.7)
y <- x*x-75
plot(x,y)

# Oformiti dijagram za kubnu funkciju
x <- seq(-4, 4, by=0.12)
y <- x*x*x-2*x*x-40
plot(x,y)

########################################################
# Dijagram kumulativne frekfencije
########################################################
# Oformiti dijagram kumulativne frekfencije za
# trajanja erupcije
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.kumulativna.frekvencija <- cumsum(trajanje.frekvencija)
podaci <- c(0, trajanje.kumulativna.frekvencija)
plot(granice, podaci, # plot the data
      main="Erupcije gejzira Old Faithful",
      xlab = "Trajanje (min)",
      ylab = "Kumulativni broj erupcija"
      )
lines(granice, podaci) #spoj tacke

########################################################
# Raspodela kumulativnih relativnih frekfencija
########################################################
# Odrediti raspodelu kumulativnih relativnih frekfencija 
# za trajanje erupcija
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.kumulativna.frekvencija <- cumsum(trajanje.frekvencija)
trajanje.kumulativna.relativna.frekvencija <- trajanje.kumulativna.frekvencija / length(trajanje)
trajanje.kumulativna.relativna.frekvencija

# Odrediti raspodelu kumulativnih relativnih frekfencija 
# za trajanje erupcija
# i prikazati je sa manjim brojem cifara
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.kumulativna.frekvencija <- cumsum(trajanje.frekvencija)
trajanje.kumulativna.relativna.frekvencija <- trajanje.kumulativna.frekvencija / length(trajanje)
staro <- options(digits=2)
trajanje.kumulativna.relativna.frekvencija
options(staro)

# Odrediti raspodelu kumulativnih relativnih frekfencija 
# za trajanje erupcija
# prikazati je sa manjim brojem cifara
# i organizovati prikaz po kolonama
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.5)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.kumulativna.frekvencija <- cumsum(trajanje.frekvencija)
trajanje.kumulativna.relativna.frekvencija <- trajanje.kumulativna.frekvencija / length(trajanje)
staro <- options(digits=2)
cbind(trajanje.kumulativna.frekvencija, 
       trajanje.kumulativna.relativna.frekvencija)
options(staro)

# Oformiti dijagram koji prikazuje raspodelu kumulativnih 
# relativnih frekfencija za trajanje erupcije
trajanje <- faithful$eruptions
granice <- seq(1.5, 5.5, by=0.3)
trajanje.rez = cut(trajanje, granice, right=FALSE)
trajanje.frekvencija = table(trajanje.rez)
trajanje.kumulativna.frekvencija <- cumsum(trajanje.frekvencija)
trajanje.kumulativna.relativna.frekvencija <- trajanje.kumulativna.frekvencija / length(trajanje)
podaci <- c(0, trajanje.kumulativna.relativna.frekvencija)
plot(granice, podaci, # plot the data
      main="Erupcije gejzira Old Faithful",
      xlab = "Trajanje (min)",
      ylab = "Kumulativna proporcija broja erupcija"
)
lines(granice, podaci) #spoj tacke

# Alternativno resenje za oformljenje dijagrama 
# koji prikazuje raspodelu kumulativnih 
# relativnih frekfencija za trajanje erupcije
trajanje <- faithful$eruptions
Fn <- ecdf(trajanje)
Fn
plot(Fn,
      main="Erupcije gejzira Old Faithful",
      xlab = "Trajanje (min)",
      ylab = "Kumulativna proporcija broja erupcija"
)

########################################################
# XY dijagram (scatter plot)
########################################################
# Odrediti XY dijagram koji prikazuje podatke 
# o trajanju erupcija
# i podatke o cekanju posle date erupcije
trajanje <- faithful$eruptions
cekanje <- faithful$waiting
plot(trajanje, cekanje, 
      xlab = "Trajanje erupcije",
      ylab= "Vreme cekanja")

# Odrediti XY dijagram koji prikazuje podatke 
# o trajanju erupcija
# i podatke o cekanju posle date erupcije.
trajanje <- faithful$eruptions
cekanje <- faithful$waiting
plot(trajanje, cekanje, 
      xlab = "Trajanje erupcije",
      ylab= "Vreme cekanja")

# Kreirati model linearne regresije za ove dve promenljive
trajanje <- faithful$eruptions
cekanje <- faithful$waiting
m.l.r <- lm(cekanje ~ trajanje)
m.l.r
# i isti iscrtati na XY dijagram pomocu funkcije abline
plot(trajanje, cekanje, 
      xlab = "Trajanje erupcije",
      ylab= "Vreme cekanja")
abline(m.l.r)