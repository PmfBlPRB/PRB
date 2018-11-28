
########################################################
# Jednacina za procenu proste regresije 
########################################################
# Primeniti prostu linearnu regresiju na okvir sa podacima
# faithful i proceniti trajanje sledece erupcije, ako je
# cekanje iznosilo 80 minuta
library(datasets)
erupcija.model <- lm(eruptions ~ waiting, data = faithful)
koeficijenti <- coefficients(erupcija.model)
koeficijenti
cekanje <- 80
trajanje <- koeficijenti[1] + cekanje * koeficijenti[2]
trajanje

# Primeniti prostu linearnu regresiju na okvir sa podacima
# faithful i proceniti trajanje sledece erupcije, ako je
# cekanje iznosilo 80 minuta
library(datasets)
erupcija.model <- lm(eruptions ~ waiting, data = faithful)
novi.podatak <- data.frame(waiting = 80)
novi.podatak
predict(erupcija.model, novi.podatak)

########################################################
# Koeficijent odredjenosti 
########################################################
# Izracunati koeficijent odredjenosti za  prosti linearni
# model okvira sa podacima faithful.
library(datasets)
erupcija.model <- lm(eruptions ~ waiting, data = faithful)
summary(erupcija.model)
koficijent.odredjenosti <- summary(erupcija.model)$r.squared
koficijent.odredjenosti

########################################################
# Test znacajnosti za linearnu regresiju 
########################################################
# Odrediti da li postoji znacajna veza izmedju promenljivih
# u linearnom regresionom modelu za okvir podataka 
# faithful sa nivoom znacajnosti 0.05
# U ovom slucaju nulta hipoteza je da je linearni clan
# (tj. beta) jednak 0.
library(datasets)
erupcija.model <- lm(eruptions ~ waiting, data = faithful)
# ako je p-vrednost manja od nivoa znacajnosti, tada se
# nulta hipoteza odbacuje i tada bi postojala znacajna veza
# izmedju promenljivih u linearnom regresionom modelu za
# okvir podataka faithful
summary(erupcija.model)

########################################################
# Interval poverenja za linearnu regresiju 
########################################################
# U okviru podataka faithful odrediti 95%-tni interval 
# poverenja za sredinu trajanja erupcije kada je vreme
# cekanja 80 minuta
library(datasets)
attach(faithful)
erupcija.model <- lm(eruptions ~ waiting)
novi.podatak <- data.frame(waiting = 80)
predict(erupcija.model, novi.podatak, 
        interval = "confidence")
detach(faithful)

########################################################
# Interval predvidjanja za linearnu regresiju 
########################################################
# U okviru podataka faithful odrediti 95%-tni interval 
# predvidjanja za sredinu trajanja erupcije kada je vreme
# cekanja 80 minuta
library(datasets)
attach(faithful)
erupcija.model <- lm(eruptions ~ waiting)
novi.podatak <- data.frame(waiting = 80)
predict(erupcija.model, novi.podatak, 
        interval = "predict")
detach(faithful)

########################################################
# Grafik ostataka (Residual plot) 
########################################################
# Odrediti grafik ostataka za prosti linearni regresioni
# model kod okvira podataka faithful 
library(datasets)
erupcija.model <- lm(eruptions ~ waiting, data = faithful)
erupcija.ostaci <- resid(erupcija.model)
plot(faithful$waiting,
     erupcija.ostaci,
     ylab = "Ostaci",
     xlab = "Cekanje",
     main = "Erupcije gejzira Old Faithful")
abline(0, 0) # horizontalna linija

########################################################
# Grafik standardizovanog ostataka 
########################################################
# Odrediti grafik standardizovanog ostataka za prosti 
# linearni regresioni model kod okvira podataka faithful,
# na osnovu posmatrane promenljive cekanje 
library(datasets)
erupcija.model <- lm(eruptions ~ waiting, data = faithful)
erupcija.standardizovani.ostaci <- rstandard(erupcija.model)
plot(faithful$waiting,
     erupcija.standardizovani.ostaci,
     ylab = "Standardizovani ostaci",
     xlab = "Cekanje",
     main = "Erupcije gejzira Old Faithful")
abline(0, 0) # horizontalna linija

########################################################
# Grafik ostataka za normalnu raspodelu 
########################################################
# Odrediti grafik normalne raspodele kod standardizovanih
# ostataka modela kod okvira podataka faithful 
library(datasets)
erupcija.model <- lm(eruptions ~ waiting, data = faithful)
erupcija.standardizovani.ostaci <- rstandard(erupcija.model)
qqnorm(erupcija.standardizovani.ostaci,
       ylab = "Standardizovani ostaci",
       xlab = "Skorovi normalne raspodele",
     main = "Erupcije gejzira Old Faithful")
qqline(erupcija.standardizovani.ostaci) # linija trenda

########################################################
# Jednacina procene za visestruku linearnu regresiju 
########################################################
# Okvir sa podacima stackloss
library(datasets)
stackloss
help(stackloss)
head(stackloss)

# Primeniti model visestruke linearne regresije na okvir 
# sa podacima stackloss i predvideti gubitak kada je vrednost 
# za airflow 72, za temperaturu 20 i za koncentraciju 85
library(datasets)
stackloss.model <- lm( stack.loss ~
                         Air.Flow + Water.Temp + Acid.Conc.,
                       data = stackloss)
stackloss.model
novi.podatak <- data.frame( Air.Flow = 72,
                            Water.Temp = 20,
                            Acid.Conc. = 85)
predict(stackloss.model, novi.podatak)

########################################################
# Visestruki koeficijent odredjenosti 
########################################################
# Izracunati koeficijent odredjenosti za visestruki linearni
# model okvira sa podacima stackloss.
library(datasets)
stackloss.model <- lm( stack.loss ~
         Air.Flow + Water.Temp + Acid.Conc.,
       data = stackloss)
summary(stackloss.model)
koficijent.odredjenosti <- summary(stackloss.model)$r.squared
koficijent.odredjenosti

########################################################
# Prilagodjeni koeficijent odredjenosti 
########################################################
# Izracunati prilagodjeni koeficijent odredjenosti za 
# visestruki linearni model okvira sa podacima stackloss.
library(datasets)
stackloss.model <- lm( stack.loss ~
                         Air.Flow + Water.Temp + Acid.Conc.,
                       data = stackloss)
prilagodjeni.koficijent.odredjenosti <- summary(stackloss.model)$adj.r.squared
prilagodjeni.koficijent.odredjenosti

########################################################
# Test znacajnosti za visestruku linearnu regresiju 
########################################################
# Sa nivoom znacajnosti 0.05 odrediti
# koje su od nezavisnih promenljivih u modelu
# visestruke linearne regersije nad okvirom podataka
# stackloss statisticki znacajne.
library(datasets)
stackloss.model <- lm( stack.loss ~
                         Air.Flow + Water.Temp + Acid.Conc.,
                       data = stackloss)
# statisticki su znacajne one promenljive cije p-vrednosti
# Pr(>|t|) u modelu ne prevazilaze vrednost nivoa znacajnosti
summary(stackloss.model)

########################################################
# Interval poverenja za visestruku linearnu regresiju 
########################################################
# U okviru sa podacima stackloss odrediti 95%-tni interval
# poverenja, ako je vrednost za airflow 72, za temperaturu
# 20 i za koncentraciju 85.
library(datasets)
attach(stackloss)
stackloss.model <- lm( stack.loss ~
                         Air.Flow + Water.Temp + Acid.Conc.)
novi.podatak <- data.frame( Air.Flow = 72,
                            Water.Temp = 20,
                            Acid.Conc. = 85)
predict(stackloss.model, novi.podatak, 
        interval = "confidence")
detach(stackloss)

########################################################
# Interval predvidjanja za visestruku linearnu regresiju 
########################################################
# U okviru sa podacima stackloss odrediti 95%-tni interval
# predvidjanja za vrednost airflow 72, temperature
# 20 i za koncentraciju kiseline 85.
library(datasets)
attach(stackloss)
stackloss.model <- lm( stack.loss ~
                         Air.Flow + Water.Temp + Acid.Conc.)
novi.podatak <- data.frame( Air.Flow = 72,
                            Water.Temp = 20,
                            Acid.Conc. = 85)
predict(stackloss.model, novi.podatak, 
        interval = "predict")
detach(stackloss)

########################################################
# Jednacina procene za logicku regresiju 
########################################################
# Koriscenjem logicke regresije za odredjivanje da li
# ce menjac na vozilima u okviru mtcars biti rucni ili 
# automatski, proceniti verovatnocu da ce menjac biti 
# rucni ako vozilo ima 120 KS i tezi 2800 funti.
menjac.model <- glm(formula = am ~ hp + wt,
                    data = mtcars,
                    family = binomial)
novi.podatak <- data.frame(hp = 120,
                           wt = 2.8)
predict(menjac.model, novi.podatak, type = "response")

########################################################
# Test znacajnosti za logicku regresiju 
########################################################
# Odrediti, sa nivoom znacajnosti 0.05, da li je neka od
# nezavisnih promenljivih iz logickog modela za vrstu menjaca
# u okviru sa podacima mtcars statisticki bezznacajna ili ne.
menjac.model <- glm(formula = am ~ hp + wt,
                    data = mtcars,
                    family = binomial)
# statisticki su znacajne one promenljive cije p-vrednosti
# Pr(>|t|) u modelu ne prevazilaze vrednost nivoa znacajnosti
summary(menjac.model)