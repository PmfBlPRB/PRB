
########################################################
# Kvalitativni podaci 
########################################################
# Okvir sa podacima faithful
faithful
help(faithful)
head(faithful)

########################################################
# Sredina 
########################################################
# Odrediti sredinu za trajanje erupcija
trajanje <- faithful$eruptions
trajanje
trajanje <- c(trajanje, 0.4,0.16)
trajanje.sredina <- mean(trajanje)
trajanje.sredina

########################################################
# Medijana 
########################################################
# Odrediti medijanu za trajanje erupcija
trajanje <- faithful$eruptions
trajanje
trajanje.medijana <- median(trajanje)
trajanje.medijana


########################################################
# Mod 
########################################################
# Odrediti najcesci broj ponavljanja za trajanje erupcija
trajanje <- faithful$eruptions
trajanje
tabela.frekfencija <- table(trajanje)
tabela.frekfencija
broj.ponavljanja <- max(tabela.frekfencija)
broj.ponavljanja

# Odrediti (jedan) mod za trajanje erupcija (preko sort)
trajanje <- faithful$eruptions
trajanje
tabela.frekfencija <- table(trajanje)
tabela.frekfencija <- sort(tabela.frekfencija)
tabela.frekfencija
mod.jedan <- tabela.frekfencija[nrow(tabela.frekfencija)]
mod.jedan

# Odrediti sve modove za trajanje erupcija (preko logickog niza)
trajanje <- faithful$eruptions
trajanje
tabela.frekfencija <- table(trajanje)
tabela.frekfencija
filter <- tabela.frekfencija == max(tabela.frekfencija)
filter
modovi.svi <- tabela.frekfencija[filter]
modovi.svi

########################################################
# Kvartil
########################################################
# Odrediti kvartile za trajanje erupcija
trajanje <- faithful$eruptions
trajanje.kvartili <- quantile(trajanje)
trajanje.kvartili

########################################################
# Percentil 
########################################################
# Odrediti 32-gi, 57-mi i 98-mi percentil za trajanje
trajanje <- faithful$eruptions
trajanje.percentili <- quantile(trajanje,
        c(0.32, 0.57, 0.98))
trajanje.percentili

# Odrediti 17-ti, 43-ci, 67-mi i 85-mi percentil za trajanje
trajanje <- faithful$eruptions
trajanje.percentili <- quantile(trajanje,
                                 c(0.17, 0.43, 0.67, 0.85))
trajanje.percentili

########################################################
# Opseg 
########################################################
# Odrediti velicinu opsega za trajanje
trajanje <- faithful$eruptions
opseg.velicina <- max(trajanje) - min(trajanje)
opseg.velicina

# Odrediti velicinu opsega za trajanje
trajanje <- faithful$eruptions
opseg <- range(trajanje)
opseg.velicina <- opseg[2] - opseg[1]
opseg.velicina

########################################################
# Opseg medju kvartilima 
########################################################
# Odrediti velicinu opsega medju kvartilima
# (po definiciji)
trajanje <- faithful$eruptions
trajanje.kvartili <- quantile(trajanje)
trajanje.kvartili
trajanje.opseg.medju.kvartilima <- trajanje.kvartili[[4]]-trajanje.kvartili[[2]]
trajanje.opseg.medju.kvartilima

# Odrediti velicinu opsega medju kvartilima
# (po definiciji) drugi nacin
trajanje <- faithful$eruptions
trajanje.kvartili <- quantile(trajanje)
trajanje.kvartili
trajanje.opseg.medju.kvartilima <- trajanje.kvartili[["75%"]]-trajanje.kvartili[["25%"]]
trajanje.opseg.medju.kvartilima

# Odrediti velicinu opsega medju kvartilima
# (koriscenjem IQR)
trajanje <- faithful$eruptions
trajanje.opseg.medju.kvartilima <- IQR(trajanje)
trajanje.opseg.medju.kvartilima

########################################################
# Dijagram tipa kutije (box plot)
########################################################
# Oformiti grafikon tipa kutije koji opisuje trajanja erupcija
trajanje <- faithful$eruptions
boxplot(trajanje, horizontal=TRUE)

########################################################
# Varijansa 
########################################################
# Odrediti varijansu za trajanje erupcija
trajanje <- faithful$eruptions
trajanje.varijansa <- var(trajanje)
trajanje.varijansa

########################################################
# Standardna devijacija 
########################################################
# Odrediti standardnu devijaciju za trajanje erupcija
trajanje <- faithful$eruptions
trajanje.standardna.devijacija <- sd(trajanje)
trajanje.standardna.devijacija

########################################################
# Kovarijansa 
########################################################
# Odrediti kovarijansu izmedju trajanja erupcija i cekanja
# u okviru sa podacima faithful
trajanje <- faithful$eruptions
cekanje <- faithful$waiting
kovarijansa <- cov(trajanje, cekanje)
kovarijansa

########################################################
# Koeficijent korelacije 
########################################################
# Odrediti koeficijent korelacije izmedju trajanja erupcija 
# i cekanja u okviru sa podacima faithful 
# (racuna se po definiciji)
trajanje <- faithful$eruptions
cekanje <- faithful$waiting
koeficijent.korelacije <- cov(trajanje, cekanje) / (sd(trajanje) * sd(cekanje))
koeficijent.korelacije

# Odrediti koeficijent korelacije izmedju trajanja erupcija 
# i cekanjau okviru sa podacima faithful 
# (racuna se funkcijom cor)
trajanje <- faithful$eruptions
cekanje <- faithful$waiting
koeficijent.korelacije <- cor(trajanje, cekanje)
koeficijent.korelacije

########################################################
# Centralni moment 
########################################################
# Odrediti treci centralni moment za trajanje erupcija
library(e1071)
trajanje <- faithful$eruptions
trajanje.treci.centralni.moment <- moment(trajanje, order=3, center=TRUE)
trajanje.treci.centralni.moment

########################################################
# Iskosenost  (skewness)
########################################################
# Odrediti iskosenost za trajanje erupcija
library(e1071)
trajanje <- faithful$eruptions
trajanje.iskosenost <- skewness(trajanje)
trajanje.iskosenost

########################################################
# Spljostenost (kurtosis) 
########################################################
# Odrediti spljostenost (koliko je glatka raspodela) 
# za trajanje erupcija
library(e1071)
trajanje <- faithful$eruptions
trajanje.kurtosis <- kurtosis(trajanje)
trajanje.kurtosis

########################################################
# Binomna raspodela 
# dbinom - zakon raspodele, pbinom - raspodela, 
# qbinom - kvantil, rbinom - generator pseudoslucajnih
########################################################
# Odrediti verovatnocu da student "na srecu" pogodi 
# tacno 4 odgovra na 12 pitanja 
# (za svako pitanje je ponudjeno 5 alternativa za odgovor)
tacna.4.od.12 <- dbinom(4, size=12, prob=0.2)
tacna.4.od.12

# Odrediti verovatnocu da student "na srecu" pogodi 
# ne vise od 4 odgovra na 12 pitanja 
# (za svako pitanje je ponudjeno 5 alternativa za odgovor)
tacna.do.4.od.12 <- dbinom(0, size=12, prob=0.2
                           )  + dbinom(1, size=12, prob=0.2
                                       ) + dbinom(2, size=12, prob=0.2
                    ) + dbinom(3, size=12, prob=0.2) + dbinom(4, size=12, prob=0.2)
tacna.do.4.od.12

# Odrediti verovatnocu da student "na srecu" pogodi 
# ne vise od 4 odgovra na 12 pitanja 
# (za svako pitanje je ponudjeno 5 alternativa za odgovor)
# Umesto binomne, koristi se kumulativna binomna raspodela
tacna.do.4.od.12 <- pbinom(4, size=12, prob=0.2)
tacna.do.4.od.12


# Odrediti raspodelu verovatnoca da student "na srecu" pogodi 
# tacno x od ukupno n pitanja 
# (verovatnoca da pogodi jedno pitanje je p)
n <- 12
p <- 0.45
argumenti <- seq(0,n)
argumenti
rezultati <- dbinom( argumenti, size=n, prob=p)
rezultati
plot(argumenti, rezultati)

# Odrediti raspodelu verovatnoca da student "na srecu" pogodi 
# x ili manje od ukupno n pitanja, gde je  
# verovatnoca da pogodi jedno pitanje je p
n <- 12
p <- 0.45
argumenti <- seq(0,n)
argumenti
rezultati <- pbinom( argumenti, size=n, prob=p)
rezultati
plot(argumenti, rezultati)

########################################################
# Poasonova raspodela 
# dpois - zakon raspodele, ppois - kumulativna raspodela, 
# qpois - kvantil, rpois - generator pseudoslucajnih
########################################################
# Neka 12 kola u proseku predje preko mosta za 1 minut.
# Odrediti verovatnocu da u datom minutu preko mosta
# predje tacno 16 kola
verovatnoca.16 <- dpois(16, lambda=12)
verovatnoca.16

# Neka 12 kola u proseku predje preko mosta za 1 minut.
# Odrediti verovatnocu da u datom minutu preko mosta
# predje 17 ili vise kola
verovatnoca.16.ili.manje <- ppois(16, lambda=12) # donji kraj
verovatnoca.17.ili.vise <- 1 - verovatnoca.16.ili.manje 
verovatnoca.17.ili.vise

# Neka 12 kola u proseku predje preko mosta za 1 minut.
# Odrediti verovatnocu da u datom minutu preko mosta
# predje 17 ili vise kola (alternativni nacin)
verovatnoca.17.ili.vise <- ppois(16, 
                                 lambda=12,
                                 lower=FALSE # gornji kraj
                                 ) 
verovatnoca.17.ili.vise


# Prikazati zakon funkcije raspodele za Poasonovu raspodelu.
lambda.parametar <- 12
opseg <- 2 * lambda.parametar
argumenti <- seq(0,opseg)
rezultati <- dpois(argumenti, lambda=lambda.parametar)
plot(argumenti, rezultati)

# Neka lambda.parametar kola u proseku predje preko mosta za 1 minut.
# Odrediti kumulativnu raspodelu, tj.  verovatnocu da u datom minutu preko mosta
# predje x ili manje kola.
lambda.parametar <- 12
opseg <- 2 * lambda.parametar
argumenti <- seq(0,opseg)
rezultati <- ppois( argumenti, lambda=lambda.parametar)
plot(argumenti, rezultati)

########################################################
# Uniformna raspodela 
# dunif - gustina, punif - raspodela, 
# qunif - kvantil, runif - generator pseudoslucajnih
########################################################
# Oformiti osam pseudoslucajnih brojeva izmedju 1 i 3
# ovaj niz pseudoslucajnih brojeva ima uniformnu raspodelu
slucajni <- runif(8, min=1, max=3)
slucajni

# Prikazati gustinu za uniformnu raspodelu.
donja.granica <- 1
gornja.granica <- 3
opseg <- gornja.granica - donja.granica
podela <- 10
argumenti <- seq(donja.granica-1, gornja.granica+1, by=opseg/podela)
rezultati <- dunif( argumenti, min=donja.granica, max=gornja.granica )
plot(argumenti, rezultati)

# Prikazati raspodelu verovatnoca da slucajno izabran broj iz 
# intervala bude manji ili jednak od x.
donja.granica <- 1
gornja.granica <- 3
opseg <- gornja.granica - donja.granica
podela <- 10
argumenti <- seq(donja.granica-1, gornja.granica+1, by=opseg/podela)
rezultati <- punif( argumenti, min=donja.granica, max=gornja.granica )
plot(argumenti, rezultati)

########################################################
# Eksponencijalna raspodela 
# dexp - gustina, pexp - raspodela, 
# qexp - kvantil, rexp - generator pseudoslucajnih
########################################################
# Neka je srednje vreme za obradu na kasi 3 minuta.
# Odrediti verovatnocu da je obrada zavrsena za manje od 2 minuta.
# Ovde se radi o eksponecionalnoj raspodeli sa brzinom 
# procesiranja 1/3 musterije po minuti.
verovatnoca <- pexp(2, rate=1/3)
verovatnoca

# Prikazati gustinu za eksponencionalnu raspodelu.
mi.parametar <- 0.7
donja.granica <- 0
gornja.granica <- 7
opseg <- gornja.granica - donja.granica
broj.tacaka <- 20
argumenti <- seq(donja.granica, gornja.granica, by=opseg/broj.tacaka)
rezultati <- dexp( argumenti, rate = mi.parametar )
plot(argumenti, rezultati)

# Neka je srednje vreme za obradu mi.parametar minuta.
# Prikazati raspodelu verovatnoca do je obrada zavrsena za manje od x minuta.
mi.parametar <- 0.7
donja.granica <- 0
gornja.granica <- 7
opseg <- gornja.granica - donja.granica
broj.tacaka <- 20
argumenti <- seq(donja.granica, gornja.granica, by=opseg/broj.tacaka)
rezultati <- pexp( argumenti, rate = mi.parametar )
plot(argumenti, rezultati)


########################################################
# Normalna raspodela 
# dnorm - gustina, pnorm - raspodela, 
# qnorm - kvantil, rnorm - generator pseudoslucajnih
########################################################
# Neka se rezultati testova uklapaju u normalnu raspodelu
# sa sredinom 72 i sa stanadrdnom devijacijom 15.2.
# Odrediti procenat studenata koji su osvojili 84 ili vise bodova. 
verovatnoca <- pnorm(84, # vrednost
                      mean = 72, # sredina
                      sd = 15.2, # standardnd devijacija
                      lower.tail=FALSE # interesuje nas samo gornja strana
  )
verovatnoca
procenat <- 100 * verovatnoca
procenat
staro <- options(digits=4)
procenat
options(staro)

# Prikazati gustinu za normalnu raspodelu.
# sa sredinom 72 i sa stanadrdnom devijacijom 15.2.
mean.parametar <- 72
sd.parametar <- 15.2
donja.granica <- 10
gornja.granica <- 120
opseg <- gornja.granica - donja.granica
broj.tacaka <- 50
argumenti <- seq(donja.granica, gornja.granica, by=opseg/broj.tacaka)
rezultati <- dnorm( argumenti, mean = mean.parametar, sd = sd.parametar )
plot(argumenti, rezultati)

# Neka se rezultati testova uklapaju u normalnu raspodelu 
# sa sredinom 72 i sa stanadrdnom devijacijom 15.2.
# Odrediti raspodelu verovatnoca da je student osvojio x ili vise bodova. 
mean.parametar <- 72
sd.parametar <- 15.2
donja.granica <- 10
gornja.granica <- 120
opseg <- gornja.granica - donja.granica
broj.tacaka <- 50
argumenti <- seq(donja.granica, gornja.granica, by=opseg/broj.tacaka)
rezultati <- pnorm( argumenti, mean = mean.parametar, sd = sd.parametar, lower.tail=FALSE )
plot(argumenti, rezultati)


########################################################
# Hi-kvadratna raspodela 
# dchisq - gustina, pchisq - raspodela, 
# qchisq - kvantil, rchisq - generator pseudoslucajnih
########################################################
# Odrediti 95-ti percentil Hi kvadratne raspodela sa 7 stepena slobode
# Koristi se kvantil f-ja hi kvadratne raspodele
percentil.95 <- qchisq(
  0.95, # koji se percentil racuna
  df = 7 # broj stepena slobode hi-kvadratne raspodele
  )
percentil.95

# Prikazati gustinu za Hi-kvadratnu raspodelu.
broj.stepena.slobode <- 7
donja.granica <- 0
gornja.granica <- 20
opseg <- gornja.granica - donja.granica
broj.tacaka <- 50
argumenti <- seq(donja.granica, gornja.granica, by=opseg/broj.tacaka)
rezultati <- dchisq( argumenti, df = broj.stepena.slobode )
plot(argumenti, rezultati)

########################################################
# Studentova t raspodela 
# dt - gustina, pt - raspodela, 
# qt - kvantil, rt - generator pseudoslucajnih
########################################################
# Odrediti 2.5-ti i 97.5-ti percentil Studentove t raspodela 
# sa 5 stepena slobode
# Koristi se kvantil f-ja Studentove raspodele
percentili <- qt(c(0.025, 0.975), df = 5)
percentili

# Prikazati gustinu za Studentovu t raspodela
broj.stepena.slobode <- 5
donja.granica <- -5
gornja.granica <- 5
opseg <- gornja.granica - donja.granica
broj.tacaka <- 50
argumenti <- seq(donja.granica, gornja.granica, by=opseg/broj.tacaka)
rezultati <- dt( argumenti, df = broj.stepena.slobode )
plot(argumenti, rezultati)


########################################################
# F raspodela 
# df - gustina, pf - raspodela, 
# qf - kvantil, rf - generator pseudoslucajnih
########################################################
# Odrediti 95-ti percentil F raspodela sa (5,2) stepena slobode
# Koristi se kvantil f-ja F raspodele
percentil.95 <- qf(
  0.95, # koji se percentil racuna
  df1 = 5, df2 = 2 # stepeni slobode F raspodele
)
percentil.95

# Prikazati gustinu za Studentovu t raspodela
broj.stepena.slobode.1 <- 5
broj.stepena.slobode.2 <- 2
donja.granica <- 0
gornja.granica <- 5
opseg <- gornja.granica - donja.granica
broj.tacaka <- 50
argumenti <- seq(donja.granica, gornja.granica, by=opseg/broj.tacaka)
rezultati <- df( argumenti, df1 = broj.stepena.slobode.1, df2 = broj.stepena.slobode.2 )
plot(argumenti, rezultati)
