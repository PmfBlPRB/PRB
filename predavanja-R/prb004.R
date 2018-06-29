
########################################################
# Procene intervala 
########################################################
# Okvir sa podacima survey
library(MASS)
survey
help(survey)
head(survey)

########################################################
# Tackasta procena sredine populacije 
########################################################
# Odrediti tackastu procenu srednje visine studenta
library(MASS)
upitnik.visine <- survey$Height
srednja.visina <- mean(
  upitnik.visine, 
  na.rm=TRUE) # iskljuciti nedostajuce vrednosti
srednja.visina

########################################################
# Intervalska procena sredine populacije pri poznatoj varijansi 
########################################################
# Neka je stanadrdna devijacija populacije 9.48.
# Odrediti marginu greske i procenu intervala sa nivoom poverenja 95%
# po definiciji
library(MASS)
upitnik.visine <- na.omit(survey$Height) # uklanjaju se nedostajuce vrednosti
n <- length(upitnik.visine)
sigma <- 9.48
sem <- sigma/sqrt(n) # standrdna greska sredina
E <- qnorm(0.975) * sem # margina greske
E
xbar <- mean(upitnik.visine) + c(-E, E) # krajevi intervala
xbar

# Neka je stanadrdna devijacija populacije 9.48.
# Odrediti marginu greske i procenu intervala sa nivoom poverenja 95%
# koriscenjem z.test funkcije
library(MASS)
upitnik.visine <- na.omit(survey$Height) # uklanjaju se nedostajuce vrednosti
library(TeachingDemos)
z.test(upitnik.visine, sd=9.48)

########################################################
# Intervalska procena sredine populacije pri nepoznatoj varijansi 
########################################################
# Odrediti procenu intervala sa nivoom poverenja 95%, 
# bez pretpostavke o vrednosti stanadrdne devijacije
library(MASS)
upitnik.visine <- na.omit(survey$Height) # uklanjaju se nedostajuce vrednosti
n <- length(upitnik.visine)
s <- sd(upitnik.visine) # standardna devijacija uzorka
SE <- s / sqrt(n) # procena standardne greske
E <- qt(# odredjivanje margine greske
  0.975, # kako je Studentova raspodela sa dva kraja, a f-ja qt racuna samo jedan kraj
         # to se nivo poverenja 0.950 iz teksta zadatka transformise u 0.975
  df = n-1) *SE
E
xbar <- mean(upitnik.visine) + c(-E, E) # krajevi intervala
xbar

# Odrediti procenu intervala sa nivoom poverenja 95%, 
# bez pretpostavke o stanadrdnoj devijaciji
library(MASS)
upitnik.visine <- na.omit(survey$Height) # uklanjaju se nedostajuce vrednosti
library(TeachingDemos)
t.test(upitnik.visine)


########################################################
# Velicina uzorka za sredinu populacije 
########################################################
# Neka je standardna devijacija podataka 9.48.
# Odrediti velicinu uzorka koja je potrebna da bi se dobila 
# margina greske od 1.2 sa 95%-tnim intervalom poverenja.
arg <- 1- ((1-0.95)/2) # kako je normalna raspodela dvostrana (sa dva kraja), 
                            # a kod f-je qnorm se racuna samo gornja strana
                            # to je potrebno prepoloviti velicinu intervala
z.star <- qnorm(arg)  
sigma <- 9.48
E <- 1.2
number <- z.star^2 * sigma^2 / E^2
number

########################################################
# Tackasta procena za proporciju u populaciji 
########################################################
# Odrediti tackastu procenu za broj studenata zenskog pola
library(MASS)
upitnik.pol <- na.omit(survey$Sex) # uklanjaju se nedostajuce vrednosti
n <- length(upitnik.pol)
#upitnik.pol == "Female"
n.f <- sum(upitnik.pol == "Female")
r.f <- n.f / n
r.f

########################################################
# Intervalska procena za proporciju u populaciji 
########################################################
# Odrediti marginu greske i proceniti interval za 
# udeo studenata zenskog pola sa nivoom poverenja 95% 
# (racuna se po definiciji)
library(MASS)
upitnik.pol <- na.omit(survey$Sex) # uklanjaju se nedostajuce vrednosti
n <- length(upitnik.pol)
n.f <- sum(upitnik.pol == "Female")
udeo.zena <- n.f / n
udeo.zena
standardna.greska <- sqrt(udeo.zena*(1-udeo.zena)/n)
standardna.greska
arg <-  1- ((1 - 0.95) / 2) # normalna raspodela ima dva kraja
                            # pa interval poverenja od 95%
                            # odgovara percentilu arg = 97.5
margina.greske <- qnorm(arg) * standardna.greska
interval.poverenja <- udeo.zena + c(-margina.greske, margina.greske)
interval.poverenja

# Odrediti marginu greske i proceniti interval za 
# udeo studenata zenskog pola sa nivoom poverenja 95% 
# (racuna se po koriscenjem f-je prop.test)
library(MASS)
upitnik.pol <- na.omit(survey$Sex) # uklanjaju se nedostajuce vrednosti
n <- length(upitnik.pol)
n.f <- sum(upitnik.pol == "Female")
library(stats)
prop.test(n.f, n)

########################################################
# Velicina uzorka za proporciju u populaciji 
########################################################
# Koriscenjem planirane procene proporcije od 50%, odrediti
# velicinu uzorka za upitnik zenskih studenata 
# sa nivoom poverenja 95%
zstar <- qnorm(0.975) # kako se radi o normalnoj raspodeli
                      # interval poverenja 95% ukazuje da se
                      # koristi 97.5-ti percentil gornjeg dela
p <- 0.5 # planirana proporcija
margina.greske <- 0.05
velicina.uzorka <- zstar^2 * p * (1-p) / margina.greske^2
velicina.uzorka

########################################################
# Donji jednostrani test za sredinu populacije 
# kada je poznata varijansa 
########################################################
# Neka proizvodjac tvrdi da sijalica radi duze od 10000 sati.
# Na primeru od 30 sijalica smo utvrdili da one u proseku 
# rade 9900 sati. Naka je standardna devijacija 120 sati.
# Odrediti da li se sa nivoom znacajnosti 0.05 moze odbaciti 
# tvrdnja proizvodjaca.
# U ovom slucaju, nulta hipoteza je da je mean>=10000
# Racunamo test statistiku
sample.mean <- 9900
hipothetized.value <- 10000
standard.deviation <- 120
n <- 30
test.statistics.value <- (sample.mean - hipothetized.value 
                          ) /(standard.deviation / sqrt(n))
test.statistics.value
# Racunamo kriticnu vrednost
sigificance.level <- 0.05
critical.value = qnorm(1 - sigificance.level)
critical.value
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistics.value < -critical.value) sprintf(
  "Kako je test statistika %f < kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)
if(test.statistics.value >= -critical.value) sprintf(
  "Kako je test statistika %f >= kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f NE ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)

# Neka proizvodjac tvrdi da sijalica radi duze od 10000 sati.
# Na primeru od 30 sijalica smo utvrdili da one u proseku 
# rade 9900 sati. Naka je standardna devijacija 120 sati.
# Odrediti da li se sa nivoom znacajnosti 0.05 moze odbaciti 
# tvrdnja proizvodjaca.
# U ovom slucaju, nulta hipoteza je da je mean>=10000
# Racunamo test statistiku
sample.mean <- 9900
hipothetized.value <- 10000
standard.deviation <- 120
n <- 30
test.statistics.value <- (sample.mean - hipothetized.value 
                          )/ (standard.deviation / sqrt(n))
# Racunamo f-jom pnorm donju p-vrednost za test statistiku
p.value <- pnorm(test.statistics.value)
p.value
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
sigificance.level <- 0.05
sigificance.level
if(p.value < sigificance.level) sprintf(
  "Kako je p vrednost %f< nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f ODBACUJE",
  p.value, sigificance.level, 
  sigificance.level, hipothetized.value)
if(p.value >= sigificance.level) sprintf(
  "Kako je p vrednost %f >= nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f NE ODBACUJE",
  p.value, sigificance.level,         
  sigificance.level, hipothetized.value)

########################################################
# Gornji jednostranni test za sredinu populacije 
# kada je poznata varijansa 
########################################################
# Neka na etiketi za kolace pise da svaki od kolaca sadrzi 
# najvise dva grama masti. Neka je u grupi od 35 kolaca
# odredjena srednja kolicina masti od 2.1 gram.
# Pretpostavimo da standardna devijacija iznosi 0.25 grama.
# Odrediti, sa nivoom znacajnosti 0.05, da li se moze 
# odbaciti tvrdjenje na etiketi za kolace.
# U ovom slucaju, nulta hipoteza je da je mean<=2.
# Racunamo test statistiku
sample.mean <- 2.1
hipothetized.value <- 2
standard.deviation <- 0.25
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value
                          ) /(standard.deviation / sqrt(n))
test.statistics.value
# Racunamo kriticnu vrednost
sigificance.level <- 0.05
critical.value = qnorm(1-sigificance.level)
critical.value
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistics.value > -critical.value) sprintf(
  "Kako je %f>%f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean<=%.0f ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)
if(test.statistics.value <= critical.value) sprintf(
  "Kako je test statistika  %f >= kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean<=%.0f NE ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)

# Neka na etiketi za kolace pise da svaki od kolaca sadrzi 
# najvise dva grama masti. Neka je u grupi od 35 kolaca
# odredjena srednja kolicina masti od 2.1 gram.
# Pretpostavimo da standardna devijacija iznosi 0.25 grama.
# Odrediti, sa nivoom znacajnosti 0.05, da li se moze 
# odbaciti tvrdjenje na etiketi za kolace.
# U ovom slucaju, nulta hipoteza je da je mean<=2.
# Racunamo test statistiku
sample.mean <- 2.1
hipothetized.value <- 2
standard.deviation <- 0.25
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value 
) /(standard.deviation / sqrt(n))
# Racunamo f-jom pnorm gornju p-vrednost za test statistiku
p.value <- pnorm(test.statistics.value,
                  lower.tail = FALSE # gornja vrednost
                  )
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
sigificance.level <- 0.05
if(p.value < sigificance.level) sprintf(
  "Kako je p vrednost %f< nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f ODBACUJE",
  p.value, sigificance.level, 
  sigificance.level, hipothetized.value)
if(p.value >= sigificance.level)  sprintf(
  "Kako je p vrednost %f >= nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f NE ODBACUJE",
  p.value, sigificance.level, 
  sigificance.level, hipothetized.value)


########################################################
# Dvostrani test za sredinu populacije kada je poznata varijansa 
########################################################
# Pretpostavimo da je srednja tezina kraljevskih pingvina 
# iz kolonije u Antarktiku prosle godine iznosila 15.4 kg.
# Iz uzorka od 35 pingvina iz istog perioda ove godine, dobijena
# je srednja tezina od 14.6 kg. 
# Pretpostavka je da je standardna devijacija 2.5 kg.
# Odrediti da li se moze, sa nivoom znacajnosti 0.05,
# odbaciti nulta hipoteza da se tezine pingvina ne razlikuju
# u odnosu na prethodnu godinu.
# U ovom slucaju, nulta hipoteza je da je mean=15.4.
# Racunamo test statistiku
sample.mean <- 14.6
hipothetized.value <- 15.4
standard.deviation <- 2.5
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value
                          ) /(standard.deviation / sqrt(n))
test.statistics.value
# Racunamo kriticne vrednosti
sigificance.level <- 0.05
critical.level = qnorm(1 - sigificance.level / 2)
critical.values <- c(-critical.level, critical.level)
critical.values
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistics.value < critical.values[1] || test.statistics.value > critical.values[2]) sprintf(
  "Kako je test statistika van intervala kriticnih vrednosti, to se nulta hipoteza da je mean=15.4 ODBACUJE")
if(test.statistics.value >= critical.values[1] &&  test.statistics.value <= critical.values[2]) sprintf(
  "Kako je test statistika unutar intervala kriticnih vrednosti, to se nulta hipoteza da je mean=15.4 NE ODBACUJE")

# Pretpostavimo da je srednja tezina kraljevskih pingvina 
# iz kolonije u Antarktiku prosle godine iznosila 15.4 kg.
# Iz uzorka od 35 pingvina iz istog perioda ove godine, dobijena
# je srednja tezina od 14.6 kg. 
# Pretpostavka je da je standardna devijacija 2.5 kg.
# Odrediti da li se moze, sa nivoom znacajnosti 0.05,
# odbaciti nulta hipoteza da se tezine pingvina ne razlikuju
# u odnosu na prethodnu godinu.
# U ovom slucaju, nulta hipoteza je da je mean=15.4.
# Racunamo test statistiku
sample.mean <- 14.6
hipothetized.value <- 15.4
standard.deviation <- 2.5
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value
                          )/(standard.deviation / sqrt(n))
# Racunamo f-jom pnorm p-vrednost za test statistiku
p.value <-  2* pnorm(test.statistics.value) # donja vrednost
p.value
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
sigificance.level <- 0.05
sigificance.level
if(p.value < sigificance.level)  sprintf(
  "Kako je p-vrednost manja od nivoa znacajnosti, to se nulta hipoteza da je mean=15.4 ODBACUJE")
if(p.value >= sigificance.level) sprintf(
  "Kako je p-vrednost veca ili jednaka od nivoa znacajnosti, to se nulta hipoteza da je mean=15.4 NE ODBACUJE")

########################################################
# Donji jednostrani test za sredinu populacije 
# kada je nepoznata varijansa 
########################################################
# Neka proizvodjac tvrdi da sijalica radi duze od 10000 sati.
# Na primeru od 30 sijalica smo utvrdili da one u proseku 
# rade 9900 sati. Naka je standardna devijacija 125 sati.
# Odrediti da li se sa nivoom znacajnosti 0.05 moze odbaciti 
# tvrdnja proizvodjaca.
# U ovom slucaju, nulta hipoteza je da je mean>=10000
# Racunamo test statistiku
sample.mean <- 9900
hipothetized.value <- 10000
standard.deviation <- 125
n <- 30
test.statistics.value <- (sample.mean - hipothetized.value
                          ) /(standard.deviation / sqrt(n))
test.statistics.value
# Racunamo kriticnu vrednost
sigificance.level <- 0.05
critical.value = qt(1 - sigificance.level, df = n - 1)
-critical.value
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistics.value < -critical.value) sprintf(
  "Kako je test statistika %f < kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)
if(test.statistics.value >= -critical.value) sprintf(
  "Kako je test statistika %f >= kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f NE ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)

# Neka proizvodjac tvrdi da sijalica radi duze od 10000 sati.
# Na primeru od 30 sijalica smo utvrdili da one u proseku 
# rade 9900 sati. Naka je standardna devijacija 125 sati.
# Odrediti da li se sa nivoom znacajnosti 0.05 moze odbaciti 
# tvrdnja proizvodjaca.
# U ovom slucaju, nulta hipoteza je da je mean>=10000
# Racunamo test statistiku
sample.mean <- 9900
hipothetized.value <- 10000
standard.deviation <- 125
n <- 30
test.statistics.value <- (sample.mean - hipothetized.value
                          ) /(standard.deviation / sqrt(n))
# Racunamo f-jom pt donju p-vrednost za test statistiku
p.value <- pt(test.statistics.value, df = n - 1)
p.value
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
sigificance.level <- 0.05
sigificance.level
if(p.value < sigificance.level) sprintf(
  "Kako je p vrednost %f< nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f ODBACUJE",
  p.value, sigificance.level, 
  sigificance.level, hipothetized.value)
if(p.value >= sigificance.level) sprintf(
  "Kako je p vrednost %f >= nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f NE ODBACUJE",
  p.value, sigificance.level,         
  sigificance.level, hipothetized.value)

########################################################
# Gornji jednostrani test za sredinu populacije 
# kada je nepoznata varijansa 
########################################################
# Neka na etiketi za kolace pise da svaki od kolaca sadrzi 
# najvise dva grama masti. Neka je u grupi od 35 kolaca
# odredjena srednja kolicina masti od 2.1 gram.
# Pretpostavimo da standardna devijacija iznosi 0.3 grama.
# Odrediti, sa nivoom znacajnosti 0.05, da li se moze 
# odbaciti tvrdjenje na etiketi za kolace.
# U ovom slucaju, nulta hipoteza je da je mean<=2.
# Racunamo test statistiku
sample.mean <- 2.1
hipothetized.value <- 2
standard.deviation <- 0.3
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value
                          ) /(standard.deviation / sqrt(n))
test.statistics.value
# Racunamo kriticnu vrednost
sigificance.level <- 0.05
critical.value = qt(1-sigificance.level, df = n - 1)
critical.value
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistics.value > -critical.value) sprintf(
  "Kako je test statistika %f > kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean <= %.2f ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)
if(test.statistics.value <= critical.value) sprintf(
  "Kako je test statistika %f <= kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean <= %.2f NE ODBACUJE",
  test.statistics.value, -critical.value, 
  sigificance.level, hipothetized.value)


# Neka na etiketi za kolace pise da svaki od kolaca sadrzi 
# najvise dva grama masti. Neka je u grupi od 35 kolaca
# odredjena srednja kolicina masti od 2.1 gram.
# Pretpostavimo da standardna devijacija iznosi 0.3 grama.
# Odrediti, sa nivoom znacajnosti 0.05, da li se moze 
# odbaciti tvrdjenje na etiketi za kolace.
# U ovom slucaju, nulta hipoteza je da je mean<=2.
# Racunamo test statistiku
sample.mean <- 2.1
hipothetized.value <- 2
standard.deviation <- 0.3
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value
                          ) /(standard.deviation / sqrt(n))
# Racunamo f-jom pt gornju p-vrednost za test statistiku
p.value <- pt(test.statistics.value, 
              df = n - 1,
              lower.tail = FALSE) # uzima se gornja vrednost
p.value
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
sigificance.level <- 0.05
sigificance.level
if(p.value < sigificance.level) sprintf(
  "Kako je p vrednost %f< nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f ODBACUJE",
  p.value, sigificance.level, 
  sigificance.level, hipothetized.value)
if(p.value >= sigificance.level) sprintf(
  "Kako je p vrednost %f >= nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je mean>=%.0f NE ODBACUJE",
  p.value, sigificance.level,         
  sigificance.level, hipothetized.value)

########################################################
# Dvostrani test za sredinu populacije kada je nepoznata varijansa 
########################################################
# Pretpostavimo da je srednja tezina kraljevskih pingvina 
# iz kolonije u Antarktiku prosle godine iznosila 15.4 kg.
# Iz uzorka od 35 pingvina iz istog perioda ove godine, dobijena
# je srednja tezina od 14.6 kg. 
# Pretpostavka je da je standardna devijacija 2.5 kg.
# Odrediti da li se moze, sa nivoom znacajnosti 0.05,
# odbaciti nulta hipoteza da se tezine pingvina ne razlikuju
# u odnosu na prethodnu godinu.
# U ovom slucaju, nulta hipoteza je da je mean=15.4.
# Racunamo test statistiku
sample.mean <- 14.6
hipothetized.value <- 15.4
standard.deviation <- 2.5
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value
                          ) /(standard.deviation / sqrt(n))
test.statistics.value
# Racunamo kriticne vrednosti
sigificance.level <- 0.05
critical.level = qt(1 - sigificance.level/2, # test je dvostraan, pa se polvovi interval povernja 
                    df = n - 1)
critical.values <- c(-critical.level, critical.level)
critical.values
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistics.value < critical.values[1] || test.statistics.value > critical.values[2]) sprintf(
  "Kako je test statistika van intervala kriticnih vrednosti, to se nulta hipoteza da je mean=15.4 ODBACUJE")
if(test.statistics.value >= critical.values[1] &&  test.statistics.value <= critical.values[2]) sprintf(
  "Kako je test statistika unutar intervala kriticnih vrednosti, to se nulta hipoteza da je mean=15.4 NE ODBACUJE")

# Pretpostavimo da je srednja tezina kraljevskih pingvina 
# iz kolonije u Antarktiku prosle godine iznosila 15.4 kg.
# Iz uzorka od 35 pingvina iz istog perioda ove godine, dobijena
# je srednja tezina od 14.6 kg. 
# Pretpostavka je da je standardna devijacija 2.5 kg.
# Odrediti da li se moze, sa nivoom znacajnosti 0.05,
# odbaciti nulta hipoteza da se tezine pingvina ne razlikuju
# u odnosu na prethodnu godinu.
# U ovom slucaju, nulta hipoteza je da je mean=15.4.
# Racunamo test statistiku
sample.mean <- 14.6
hipothetized.value <- 15.4
standard.deviation <- 2.5
n <- 35
test.statistics.value <- (sample.mean - hipothetized.value
) /(standard.deviation / sqrt(n))
# Racunamo f-jom pt p-vrednost za test statistiku
p.value <- 2 * pt(test.statistics.value, df = n -1) 
p.value # donja vrednost, a test je dvostrani
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
sigificance.level <- 0.05
sigificance.level
if(p.value < sigificance.level)  sprintf(
  "Kako je p-vrednost manja od nivoa znacajnosti, to se nulta hipoteza da je mean=15.4 ODBACUJE")
if(p.value >= sigificance.level) sprintf(
  "Kako je p-vrednost veca ili jednaka od nivoa znacajnosti, to se nulta hipoteza da je mean=15.4 NE ODBACUJE")

########################################################
# Donji jednostrani test za proporciju populacije 
########################################################
# Neka je 60% gradjana glasalo na proslim izborima.
# Pri telefonskom upitniku je 85 od 148 ljudi reklo
# da ce glasati na izborima. 
# Odrediti da li se sa nivoom znacajnosti 0.05 moze
# odbaciti nulta hipoteza da ce proporcija glasaca
# ove godine biti iznad 60%
# Racunamo test-statistiku
uzorak.proporcija <- 85 / 148
hipoteza.vrednost <- 0.6
n <- 148
test.statistika <- (uzorak.proporcija - hipoteza.vrednost
  ) / sqrt(hipoteza.vrednost * (1 - hipoteza.vrednost) / n )
test.statistika
# Racunamo kriticnu vrednost
nivo.znacajnosti <- 0.05
kriticna.vrednost <- qnorm( 1 - nivo.znacajnosti )
kriticna.vrednost <- -kriticna.vrednost
kriticna.vrednost
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistika < kriticna.vrednost) sprintf(
  "Kako je test statistika %f < kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p >= %.2f ODBACUJE",
  test.statistika, kriticna.vrednost, 
  nivo.znacajnosti, hipoteza.vrednost)
if(test.statistika >= kriticna.vrednost) sprintf(
  "Kako je test statistika %f >= kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p >= %.2f NE ODBACUJE",
  test.statistika, kriticna.vrednost, 
  nivo.znacajnosti, hipoteza.vrednost)

# Neka je 60% gradjana glasalo na proslim izborima.
# Pri telefonskom upitniku je 85 od 148 ljudi reklo
# da ce glasati na izborima. 
# Odrediti da li se sa nivoom znacajnosti 0.05 moze
# odbaciti nulta hipoteza da ce proporcija glasaca
# ove godine biti iznad 60%
# Racunamo test-statistiku
uzorak.proporcija <- 85 / 148
hipoteza.vrednost <- 0.6
n <- 148
test.statistika <- (uzorak.proporcija - hipoteza.vrednost
                    ) / sqrt(hipoteza.vrednost * (1 - hipoteza.vrednost) / n )
# Racunamo f-jom pnorm donju p-vrednost za test statistiku
p.vrednost <- pnorm(test.statistika)
p.vrednost # p-vrednost sa donjeg kraja (leva)
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
nivo.znacajnosti <- 0.05
nivo.znacajnosti
if(p.vrednost < nivo.znacajnosti) sprintf(
  "Kako je p vrednost %f < nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p >= %.2f ODBACUJE",
  p.vrednost, nivo.znacajnosti, 
  nivo.znacajnosti, hipothetihipoteza.vrednostzed.value)
if(p.vrednost >= nivo.znacajnosti) sprintf(
  "Kako je p vrednost %f >= nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p >= %.2f NE ODBACUJE",
  p.vrednost, nivo.znacajnosti,         
  nivo.znacajnosti, hipoteza.vrednost)

# Neka je 60% gradjana glasalo na proslim izborima.
# Pri telefonskom upitniku je 85 od 148 ljudi reklo
# da ce glasati na izborima. 
# Odrediti da li se sa nivoom znacajnosti 0.05 moze
# odbaciti nulta hipoteza da ce proporcija glasaca
# ove godine biti iznad 60%
# Direktno primenimo f-ju prop.test za racunanje p-vrednosti, 
# sa iskljucenom Jetsovom ispravkom neprekidnosti (iz pedagoskih razloga)
prop.test( 85, 148, p = 0.6, 
           alt = "less", # donji jednostrani test
           correct = FALSE) # Jetsova ispravka je iskljucena

########################################################
# Gornji jednostrani test za proporciju populacije 
########################################################
# Neka je 12% jabuka od prosle godine bilo trulo.
# U ovogodisnjem rodu je 30 od 214 jabuka trulo.
# Da li se sa nivoom znacajnosti 0.05 moze odbaciti
# nulta hipoteza da je kolicina trulih jabuka ostala
# i ove godine ispod 12%?
# Racunamo test-statistiku
uzorak.proporcija <- 30 / 214
hipoteza.vrednost <- 0.12
n <- 214
test.statistika <- (uzorak.proporcija - hipoteza.vrednost
                    ) / sqrt(hipoteza.vrednost * (1 - hipoteza.vrednost) / n)
test.statistika
# Racunamo kriticnu vrednost
nivo.znacajnosti <- 0.05
kriticna.vrednost <- qnorm( 1 - nivo.znacajnosti )
kriticna.vrednost
# Proveravamo odnos izmedju test statistike i kriticne vrednosti
# i prikazujemo dobijeni zakljucak
if(test.statistika > kriticna.vrednost) sprintf(
  "Kako je test statistika %f > kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p <= %.2f ODBACUJE",
  test.statistika, kriticna.vrednost, 
  nivo.znacajnosti, hipoteza.vrednost)
if(test.statistika <= kriticna.vrednost) sprintf(
  "Kako je test statistika  %f <= kriticne vrednosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p <= %.2f NE ODBACUJE",
  test.statistika, kriticna.vrednost, 
  nivo.znacajnosti, hipoteza.vrednost)

# Neka je 12% jabuka od prosle godine bilo trulo.
# U ovogodisnjem rodu je 30 od 214 jabuka trulo.
# Da li se sa nivoom znacajnosti 0.05 moze odbaciti
# nulta hipoteza da je kolicina trulih jabuka ostala
# i ove godine ispod 12%?
# Racunamo test-statistiku
uzorak.proporcija <- 30 / 214
hipoteza.vrednost <- 0.12
n <- 214
test.statistika <- (uzorak.proporcija - hipoteza.vrednost
                    ) / sqrt(hipoteza.vrednost * (1 - hipoteza.vrednost) / n)
# Racunamo f-jom pnorm gornju p-vrednost za test statistiku
p.vrednost <- pnorm(test.statistika, lower.tail = FALSE)
p.vrednost # gornja p-vrednost (desna)
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
nivo.znacajnosti <- 0.05
nivo.znacajnosti
if(p.vrednost < nivo.znacajnosti) sprintf(
  "Kako je p vrednost %f < nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p <= %.2f ODBACUJE",
  p.vrednost, nivo.znacajnosti, 
  nivo.znacajnosti, hipothetihipoteza.vrednostzed.value)
if(p.vrednost >= nivo.znacajnosti) sprintf(
  "Kako je p vrednost %f >= nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p <= %.2f NE ODBACUJE",
  p.vrednost, nivo.znacajnosti,         
  nivo.znacajnosti, hipoteza.vrednost)

# Neka je 60% gradjana glasalo na proslim izborima.
# Pri telefonskom upitniku je 85 od 148 ljudi reklo
# da ce glasati na izborima. 
# Odrediti da li se sa nivoom znacajnosti 0.05 moze
# odbaciti nulta hipoteza da ce proporcija glasaca
# ove godine biti iznad 60%
# Direktno primenimo f-ju prop.test za racunanje p-vrednosti, 
# sa iskljucenom Jetsovom ispravkom neprekidnosti (iz pedagoskih razloga)
prop.test( 30, 214, p = 0.12, 
           alt = "greater", # gornji jednostrani test
           correct = FALSE) # Jetsova ispravka je iskljucena

########################################################
# Dvostrani test za proporciju populacije 
########################################################
# Neka je pri bacanju novcica od 20 puta u 12 puta dobijena glava.
# Da li se sa nivoom znacajnosti 0.05 moze odbaciti
# nulta hipoteza da je novcic fer?
# Nulta hipoteya je dakle da je p = 0.5.
# Racunamo test statistiku
uzorak.proporcija <- 12 / 20
hipoteza.vrednost <- 0.5
n <- 20
test.statistika <- (uzorak.proporcija - hipoteza.vrednost
                    ) / sqrt(hipoteza.vrednost * (1 - hipoteza.vrednost) / n)
test.statistika
# Racunamo kriticni interval
nivo.znacajnosti <- 0.05
kriticna.vrednost <- qnorm( 1 - nivo.znacajnosti/2 )
kriticni.interval <- c(-kriticna.vrednost, kriticna.vrednost)
kriticni.interval
# Proveravamo odnos izmedju test statistike i kriticnog intervala
# i prikazujemo dobijeni zakljucak
if(test.statistika < kriticni.interval[1] || test.statistika > kriticni.interval[2]) sprintf(
  "Kako je test statistika van intervala kriticnih vrednosti, to se nulta hipoteza da je p = %.2f ODBACUJE",
  hipoteza.vrednost)
if(test.statistika >= kriticni.interval[1] &&  test.statistika <= kriticni.interval[2]) sprintf(
  "Kako je test statistika unutar intervala kriticnih vrednosti, to se nulta hipoteza da je p = %2f NE ODBACUJE", 
  hipoteza.vrednost)

# Neka je pri bacanju novcica od 20 puta u 12 puta dobijena glava.
# Da li se sa nivoom znacajnosti 0.05 moze odbaciti
# nulta hipoteza da je novcic fer?
# Nulta hipoteya je dakle da je p = 0.5.
# Racunamo test statistiku
uzorak.proporcija <- 12 / 20
hipoteza.vrednost <- 0.5
n <- 20
test.statistika <- (uzorak.proporcija - hipoteza.vrednost
                    ) / sqrt(hipoteza.vrednost * (1 - hipoteza.vrednost) / n)
# Racunamo f-jom pnorm gornju p-vrednost za test statistiku
p.vrednost <- 2 * pnorm(test.statistika, lower.tail = FALSE) #gornja strana
p.vrednost # dvostrana p-vrednost 
# Proveravamo odnos izmedju p-vrednosti i nivoa znacajnosti
# i prikazujemo dobijeni zakljucak
nivo.znacajnosti <- 0.05
nivo.znacajnosti
if(p.vrednost < nivo.znacajnosti) sprintf(
  "Kako je p vrednost %f < nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p = %.2f ODBACUJE",
  p.vrednost, nivo.znacajnosti, 
  nivo.znacajnosti, hipothetihipoteza.vrednostzed.value)
if(p.vrednost >= nivo.znacajnosti) sprintf(
  "Kako je p vrednost %f >= nivoa znacajnosti %f, sa nivoom znacajnosti %3.2f se nulta hipoteza da je p = %.2f NE ODBACUJE",
  p.vrednost, nivo.znacajnosti,         
  nivo.znacajnosti, hipoteza.vrednost)

# Neka je pri bacanju novcica od 20 puta u 12 puta dobijena glava.
# Da li se sa nivoom znacajnosti 0.05 moze odbaciti
# nulta hipoteza da je novcic fer?
# Nulta hipoteya je dakle da je p = 0.5.
# Direktno primenimo f-ju prop.test za racunanje p-vrednosti, 
# sa iskljucenom Jetsovom ispravkom neprekidnosti (iz pedagoskih razloga)
prop.test( 12, 20, p = 0.5, correct = FALSE) # Jetsova ispravka je iskljucena

########################################################
# Greska tipa II kod donjeg jednostranog testa za sredinu  
# populacije kada je poznata varijansa 
########################################################
# Neka proizvodjac tvrdi da sijalica radi duze od 10000 sati.
# Pretpostavimo da je sredina za trajanje rada sijalice 9950 
# sati, a standardna devijacija 120 sati.
# Odrediti verovatnocu za gresku tipa II u uzorku od 30 sijalica. 
# Racunamo stanadrdnu devijaciju za uzorak date velicine
n <- 30
standardna.devijacija <- 120
standardna.devijacija.uzorka <- standardna.devijacija / sqrt(n)
standardna.devijacija.uzorka;
nivo.znacajnosti <- 0.05
hipoteticka.donja.granica <- 10000
granica.neodbacivanja <- qnorm(nivo.znacajnosti, 
                 mean=hipoteticka.donja.granica,
                 sd = standardna.devijacija.uzorka)
granica.neodbacivanja
# kad god je sredina uzorka veca od granica.neodbacivanja,
# tada nulta hipoteza nece biti odbacena, pa je verovatnoca
# tog dogadjaja u stavri verovatnoca greske tipa II
sredina.uzorka <- 9950
verovatnoca.greske.II <- pnorm( granica.neodbacivanja,
                                mean = sredina.uzorka,
                                sd = standardna.devijacija.uzorka,
                                lower.tail = FALSE )
verovatnoca.greske.II

########################################################
# Greska tipa II kod gornjeg jednostranog testa za sredinu  
# populacije kada je poznata varijansa 
########################################################
# Neka na etiketi za kolace pise da svaki od kolaca sadrzi 
# najvise dva grama masti. 
# Neka je sredina za mast po kolacu 2.09 grama i neka je
# standardna devijacija populacije 0.25 grama.
# Odrediti, sa nivoom znacajnosti 0.05, koja je verovatnoca 
# za gresku tipa II kada je uzorak velicine 35.
# U ovom slucaju, nulta hipoteza je da je mean<=2.
# Racunamo stanadrdnu devijaciju za uzorak date velicine
n <- 35
standardna.devijacija <- 0.25
standardna.devijacija.uzorka <- standardna.devijacija / sqrt(n)
standardna.devijacija.uzorka;
nivo.znacajnosti <- 0.05
hipoteticka.gornja.granica <- 2
granica.neodbacivanja <- qnorm(nivo.znacajnosti, 
                               mean=hipoteticka.gornja.granica,
                               sd = standardna.devijacija.uzorka,
                               lower.tail = FALSE)
granica.neodbacivanja
# kad god je sredina uzorka veca od granica.neodbacivanja,
# tada nulta hipoteza nece biti odbacena, pa je verovatnoca
# tog dogadjaja u stavri verovatnoca greske tipa II
sredina.uzorka <- 2.09
verovatnoca.greske.II <- pnorm( granica.neodbacivanja,
                                mean = sredina.uzorka,
                                sd = standardna.devijacija.uzorka )
verovatnoca.greske.II

########################################################
# Greska tipa II kod dvostranog testa za sredinu  
# populacije kada je poznata varijansa 
########################################################
# Neka je srednja tezina kraljvskih pingivna izmerenih
# prosle godine u koloniji 15.4 kg.
# Neka je aktuelna sredina populacije 15.1 kg, a standardna
# devijacija populacije 2.5 kg.
# Sa nivoovm znacajnosti od 0,05 odrediti verovatnocu
# greske tipa II za uzorak od 35 pingvina.
# Racunamo stanadrdnu devijaciju za uzorak date velicine
n <- 35
standardna.devijacija <- 2.5
standardna.devijacija.uzorka <- standardna.devijacija / sqrt(n)
standardna.devijacija.uzorka;
nivo.znacajnosti <- 0.05
hipoteticka.sredina <- 15.4
interval <- c(nivo.znacajnosti / 2, 1 - nivo.znacajnosti /2)
interval.neodbacivanja <- qnorm(interval, 
                               mean=hipoteticka.sredina,
                               sd = standardna.devijacija.uzorka)
interval.neodbacivanja
# kad god je sredina uzorka veca od granica.neodbacivanja,
# tada nulta hipoteza nece biti odbacena, pa je verovatnoca
# tog dogadjaja u stavri verovatnoca greske tipa II
sredina.uzorka <- 15.1
interval.greske.II <- pnorm( interval.neodbacivanja,
                                mean = sredina.uzorka,
                                sd = standardna.devijacija.uzorka )
interval.greske.II
verovatnoca.greske.II <- diff(interval.greske.II) # alter. interval.greske.II[2]-interval.greske.II[1]
verovatnoca.greske.II

########################################################
# Greska tipa II kod donjeg jednostranog testa za sredinu  
# populacije kada je nepoznata varijansa 
########################################################
# Neka proizvodjac tvrdi da sijalica radi duze od 10000 sati.
# Pretpostavimo da je sredina za trajanje rada sijalice 9950 
# sati, a standardna devijacija 125 sati.
# Odrediti verovatnocu za gresku tipa II u uzorku od 30 sijalica. 
# Racunamo stanadrdnu procenu greske za uzorak date velicine
n <- 30
standardna.devijacija <- 125
standardna.procena.greske <- standardna.devijacija / sqrt(n)
standardna.procena.greske;
nivo.znacajnosti <- 0.05
hipoteticka.donja.granica <- 10000
granica.neodbacivanja <- hipoteticka.donja.granica + qt(nivo.znacajnosti, 
                               df = n -1) * standardna.procena.greske
granica.neodbacivanja
# kad god je sredina uzorka veca od granica.neodbacivanja,
# tada nulta hipoteza nece biti odbacena, pa je verovatnoca
# tog dogadjaja u stavri verovatnoca greske tipa II
sredina.uzorka <- 9950
verovatnoca.greske.II <- pt( (granica.neodbacivanja - sredina.uzorka
                              ) / standardna.procena.greske,
                              df =  n - 1,
                              lower.tail = FALSE )
verovatnoca.greske.II

########################################################
# Greska tipa II kod gornjeg jednostranog testa za sredinu  
# populacije kada je nepoznata varijansa 
########################################################
# Neka na etiketi za kolace pise da svaki od kolaca sadrzi 
# najvise dva grama masti. 
# Neka je sredina za mast po kolacu 2.09 grama i neka je
# standardna devijacija populacije 0.3 grama.
# Odrediti, sa nivoom znacajnosti 0.05, koja je verovatnoca 
# za gresku tipa II kada je uzorak velicine 35.
# U ovom slucaju, nulta hipoteza je da je mean<=2.
# Racunamo stanadrdnu procenu greske za uzorak date velicine
n <- 35
standardna.devijacija <- 0.3
standardna.procena.greske <- standardna.devijacija / sqrt(n)
standardna.procena.greske;
nivo.znacajnosti <- 0.05
hipoteticka.gornja.granica <- 2
granica.neodbacivanja <- hipoteticka.gornja.granica + qt(nivo.znacajnosti, 
                                                        df = n -1,
                                                        lower.tail = FALSE) * standardna.procena.greske
granica.neodbacivanja
# kad god je sredina uzorka manja od granica.neodbacivanja,
# tada nulta hipoteza nece biti odbacena, pa je verovatnoca
# tog dogadjaja u stvari verovatnoca greske tipa II
sredina.uzorka <- 2.09
verovatnoca.greske.II <- pt( (granica.neodbacivanja - sredina.uzorka
                              ) / standardna.procena.greske,
                             df =  n - 1)
verovatnoca.greske.II

########################################################
# Greska tipa II kod dvostranog testa za sredinu  
# populacije kada je nepoznata varijansa 
########################################################
# Neka je srednja tezina kraljvskih pingivna izmerenih
# prosle godine u koloniji 15.4 kg.
# Neka je aktuelna sredina populacije 15.1 kg, a standardna
# devijacija populacije 2.5 kg.
# Sa nivoovm znacajnosti od 0,05 odrediti verovatnocu
# greske tipa II za uzorak od 35 pingvina.
# Racunamo stanadrdnu procenu greske za uzorak date velicine
n <- 35
standardna.devijacija <- 2.5
standardna.procena.greske <- standardna.devijacija / sqrt(n)
standardna.procena.greske;
nivo.znacajnosti <- 0.05
hipoteticka.sredina <- 15.4
interval <- c(nivo.znacajnosti/2, 1 - nivo.znacajnosti /2)
interval.neodbacivanja <- hipoteticka.sredina + qt(interval, 
                                                         df = n -1) * standardna.procena.greske
interval.neodbacivanja
# Dok god je sredina uzorka unutar intervala neodbacivanja
# nulta hipoteza nece biti  odbacena.
sredina.uzorka <- 15.1
interval.greske.II <- pt( (interval.neodbacivanja - sredina.uzorka
                           ) / standardna.procena.greske,
                          df = n - 1)
interval.greske.II
verovatnoca.greske.II <- interval.greske.II[2]-interval.greske.II[1] # alter. diff(interval.greske.II) 
verovatnoca.greske.II

