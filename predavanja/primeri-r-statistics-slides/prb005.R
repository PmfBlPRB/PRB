
########################################################
# Sredine populacija ciji se uzorci uklapaju 
########################################################
# Okvir sa podacima immer
library(MASS)
immer
help(immer)
head(immer)

# Ako pretpostavimo da se podaci u okviru sa podacima immer
# uklapaju u normalnu raspodelu, odrediti 95%-tni interval
# poverenja za porecnu razlike izmedju prinosa u 1931 i 1932
library(MASS)
prinos.1931 <- immer$Y1
prinos.1932 <- immer$Y2
t.test( prinos.1931, prinos.1932,
        paired = TRUE)

########################################################
# Sredine populacija kod dva nezvisna uzorka 
########################################################
mtcars
help(mtcars)
head(mtcars)

# Ako pretpostavimo da podaci iz mtcars prate normalnu
# raspodelu, odrediti 95%-tni interval poverenja za
# procenu razlike potrosnje goriva kod automobila sa
# rucnim menjacem i automobila sa automaskim menjacem
uslov.menjac.automatski <- mtcars$am == 0
potorsnja.menjac.automatski <- mtcars[uslov.menjac.automatski,]$mpg
potorsnja.menjac.automatski
potorsnja.menjac.rucni <- mtcars[!uslov.menjac.automatski,]$mpg
potorsnja.menjac.rucni
t.test(potorsnja.menjac.automatski, potorsnja.menjac.rucni)

# Ako pretpostavimo da podaci iz mtcars prate normalnu
# raspodelu, odrediti 95%-tni interval poverenja za
# procenu razlike potrosnje goriva kod automobila sa
# rucnim menjacem i automobila sa automaskim menjacem
# Alternativni nacin: modeliramo mtcars$mpg preko prediktora 
# mtcars$am i potom primenimo f-ju t.test
t.test( mpg ~ am, data = mtcars)

########################################################
# Poredjenje proporcija kod dve populacije 
########################################################
# Okvir sa podacima quine
library(MASS)
quine
help(quine)
head(quine)

# Uporediti nacionalnost(N,A) i pol(M,F) studenata
# u okviru sa podacima quine
library(MASS)
table(quine$Eth, quine$Sex)

# Ako pretpostavimo da podaci u okviru quine prate 
# normalnu raspodelu, naci 95%-tni interval poverenja
# za razliku proporcije zena medju Aboridzinskim studentima
# i proporciju zena medju ne-Aboridzinskim studentima
# (naravno, u okviru svoje grupe)
prop.test(table(quine$Eth, quine$Sex), 
          correct = FALSE)

########################################################
# Multinominalni kvalitet uklapanja 
########################################################
# Okvir sa podacima survey
library(MASS)
survey
help(survey)
head(survey)

# Odrediti vrednosti koje postoje u koloni Smoke
# okvira sa podacima survey
library(MASS)
pusenje.nivoi <- levels(survey$Smoke)
pusenje.nivoi

# Odrediti raspodelu frekfencija za nivoe pusenja
# unutar okvira sa podacima survey
library(MASS)
pusenje.frekvencija <- table(survey$Smoke)
pusenje.frekvencija


# Pretpostavimo da je na nivou kampusa statistika
# za pusenje sledeca:
# Heavy Never Occas Regul 
# 4.5%  79.5% 8.5%  7.5%
# Sa nivoom znacajnosti 0.05 proveriti da li podaci iz 
# okvira survey podrzavaju gornju statistiku.
# Nulta hipoteza je da se podaci iz okvira uklapaju u 
# statistiku na nivou kampusa
library(MASS)
pusenje.frekvencija <- table(survey$Smoke)
pusenje.frekvencija
kampus.statistika <- c(0.045, 0.795, 0.085, 0.075)
kampus.statistika
# ako p-vrednost bude veca od nivoa znacajnosti, 
# nulta hipoteza se ne odbacuje
chisq.test( pusenje.frekvencija, p = kampus.statistika )

########################################################
# Hi-kvardatni test nezavisnosti 
########################################################

# Uporediti nivo pusenja i nivo fizickih vezbi studenata
# u okviru sa podacima survey
library(MASS)
pusenje.vezbe <- table(survey$Smoke, survey$Exer)
pusenje.vezbe

# Sa nivoom znacajnosti 0.05 testirati hipotezu da je 
# nivo pusenja nezavistan od nivoa fizickih vezbi
# nulta hipoteza je da su ove dve velicine nezavisne
library(MASS)
pusenje.vezbe <- table(survey$Smoke, survey$Exer)
# ako p-vrednost bude veca od nivoa znacajnosti, 
# nulta hipoteza se ne odbacuje
chisq.test(pusenje.vezbe)

# Sa nivoom znacajnosti 0.05 testirati hipotezu da je 
# nivo pusenja nezavistan od nivoa fizickih vezbi
# nulta hipoteza je da su ove dve velicine nezavisne
# Da bi izbegli upozorenja, spajamo srodne podatke 
library(MASS)
pusenje.vezbe <- table(survey$Smoke, survey$Exer)
pusenje.vezbe.sazeto <- cbind(
  pusenje.vezbe[,"Freq"], 
  pusenje.vezbe[,"Some"] + pusenje.vezbe[,"None"])
pusenje.vezbe.sazeto  
dimnames(pusenje.vezbe.sazeto) <- list(
  c("Jako puno", "Nikad", "S vremena na vreme", "Redovno"),
  c("Cesto", "Retko"))
pusenje.vezbe.sazeto  
pusenje.vezbe.sazeto <- pusenje.vezbe.sazeto[c(1, 4, 3, 2),]
pusenje.vezbe.sazeto  
# ako p-vrednost bude veca od nivoa znacajnosti, 
# nulta hipoteza se ne odbacuje
chisq.test(pusenje.vezbe.sazeto)

