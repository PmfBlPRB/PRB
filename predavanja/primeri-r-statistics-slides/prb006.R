
########################################################
# Kompletno randomizovan dizajn 
########################################################
# Fransiza brze hrane testira marketing za 3 nove jela 
# na meniju. Izabrano je 18 restorana za testiranje,
# pri cemu se u 6 testira prvi element menija, u drugih
# 6 drugi element menija a u preostalih 6 treci element 
# menija.
# Neka su podaci kao u sledecoj tabeli:
#    Item1 Item2 Item3 
#    22    52    16 
#    42    33    24 
#    44     8    19 
#    52    47    18 
#    45    43    34 
#    37    32    39 
# i neka se nalaze u datoteci data/fastfood-1.txt
# Sa nivoom znacajnosti 0.50 proveriti da li su sredine
# prodatih kolicina za tri nova elemneta menija jednake.
prodaja.brza.hrana <- read.table("Data/fastfood-1.txt",
                                 header = TRUE)
prodaja.brza.hrana
prodaja.sirovi.podaci <- c(t(as.matrix(prodaja.brza.hrana)))
prodaja.sirovi.podaci
nivoi.tretiranja <- c("Item1", "Item2", "Item3")
broj.nivoa <- 3
posmatranja.po.nivou <- 6
faktori.tretiranja <- gl(broj.nivoa,
                         1,
                         posmatranja.po.nivou * broj.nivoa, 
                         factor(nivoi.tretiranja))
faktori.tretiranja
formula <- prodaja.sirovi.podaci ~ faktori.tretiranja
anova.values <- aov( formula )
summary(anova.values)
nivo.znacajnosti <- 0.05
summary(anova.values)
# Ako p-vrednost (Pr.) bude veca od nivoa znacajnosti,
# tada se nulta hipoteza ne moze odbaciti

########################################################
# Randomizovan blok dizajn 
########################################################
# Fransiza brze hrane testira marketing za 3 nove jela 
# na meniju. Za testiranje su izabrana 6 restorana.
# U svakom od restorana ce se testirati uspesnost svakog
# od ta 3 nova proizvoda (po jedan svake nedelje). 
# Redosled testiranja jela se takodje slucajno odredjuje.
# Neka svaki od redova tabele koja sledi predstavlja 
# brojke prodaje tri nova jela u restoranu
#     Item1 Item2 Item3 
#     31    27    24 
#     31    28    31 
#     45    29    46 
#     21    18    48 
#     42    36    46 
#     32    17    40
# i neka se nalaze u datoteci data/fastfood-2.txt
# Sa nivoom znacajnosti 0.50 proveriti da li su sredine
# prodatih kolicina za tri nova elemneta menija jednake.
prodaja.brza.hrana <- read.table("Data/fastfood-2.txt",
                                 header = TRUE)
prodaja.brza.hrana
prodaja.sirovi.podaci <- c(t(as.matrix(prodaja.brza.hrana)))
prodaja.sirovi.podaci
nivoi.tretiranja <- c("Item1", "Item2", "Item3")
broj.nivoa.tretiranja <- 3
broj.kontrolnih.blokova <- 6
uklapajuca.tretiranja <- gl(
  broj.nivoa.tretiranja,
  1,
  broj.kontrolnih.blokova * broj.nivoa.tretiranja, 
  factor(nivoi.tretiranja))
uklapajuca.tretiranja
faktori.blokiranja <- gl(
  broj.kontrolnih.blokova,
  broj.nivoa.tretiranja,
  broj.nivoa.tretiranja * broj.kontrolnih.blokova)
faktori.blokiranja
formula <- prodaja.sirovi.podaci ~ uklapajuca.tretiranja + faktori.blokiranja
anova.values <- aov( formula )
# Ako p-vrednost (Pr.) bude manja od nivoa znacajnosti,
# tada se nulta hipoteza treba odbaciti
summary(anova.values)

########################################################
# Faktorski dizajn 
########################################################
# Fransiza brze hrane testira marketing za 3 nova jela 
# na meniju i to i na Istocnoj i na Zapadnoj obali USA.
# Da bi se utvrdilo da li imaju istu popularnost, na svakoj
# obali je slucajno izabrano 12 restorana za ispitivanje.
# Saglasno sa faktorskim dizajnom, medju 12 restorana sa 
# Istocne obale, 4 su slucajno izabrana za testiranje 
# marketinga prvog jela, 4 za drugo i preostala 4 za trece.
# na isti nacin je izvrsen raspored i na Zapadnoj obali.
# Neka tabela koja sledi predstavlja brojke prodaje svakog
# jela posle nedelju dana test marketinga.
# Svaka vrsta tabele predstavlja cifre prodaje jednog jela
# u tri razlicita restorana
#     Item1,Item2,Item3 
#     E1,25,39,36 
#     E2,36,42,24 
#     E3,31,39,28 
#     E4,26,35,29 
#     W1,51,43,42 
#     W2,47,39,36 
#     W3,47,53,32 
#     W4,52,46,33 
# i neka se nalaze u datoteci data/fastfood-3.csv
# Sa nivoom znacajnosti 0.05 testirati da li su sredine
# obima prodaje za nova jela svi jednaki. 
# Takodje treba odrediti da li se raylikuju sredine 
# obima prodaje u odnosu na obalske regione.
prodaja.brza.hrana <- read.csv("Data/fastfood-3.csv")
prodaja.brza.hrana
prodaja.sirovi.podaci <- c(t(as.matrix(prodaja.brza.hrana)))
prodaja.sirovi.podaci
faktori.nivoa.1 <- c("Item1", "Item2", "Item3") 
broj.faktora.nivoa.1 <- length(faktori.nivoa.1)
faktori.nivoa.2 <- c("East", "West")
broj.faktora.nivoa.2 <- length(faktori.nivoa.2)
posmatranja.po.tretmanu <- 4
tretman.nivoa.1 <- gl(
  broj.faktora.nivoa.1,
  1,
  posmatranja.po.tretmanu * broj.faktora.nivoa.1 * broj.faktora.nivoa.2,
  factor(faktori.nivoa.1))
tretman.nivoa.1
tretman.nivoa.2 <- gl(
  broj.faktora.nivoa.2,
  posmatranja.po.tretmanu * broj.faktora.nivoa.1,
  posmatranja.po.tretmanu * broj.faktora.nivoa.1 * broj.faktora.nivoa.2,
  factor(faktori.nivoa.2))
tretman.nivoa.2
# ukljucena je interakcija tretmana u formuli
formula <- prodaja.sirovi.podaci ~ tretman.nivoa.1 * tretman.nivoa.2
anova.values <- aov( formula )
# Ako p-vrednost (Pr.) u datoj vrsti bude manja od nivoa znacajnosti,
# tada se nulta hipoteza koja odgovara toj vrsti treba odbaciti
summary(anova.values)

########################################################
# Test znaka  
########################################################
# Neka je kompanija za pica napravila novo pice i zeli
# da otkrije da li ce biti popularno kao postojece.
# Zato su organizovali ispitivanje ukusa sa 18 ucesnika.
# pet ucesnika je smatralo da je novo pice bolje, a ostali
# su vise voleli staro pice.
# Moze li se sa nivoom znacajnosti 0.05 odbaciti nulta
# hipoteza da su oba pica jednako popularna?
# Ako p-vrednost bude veca od nivoa ynacajnosti, tada se 
# nulta hipoteza ne moze odbaciti
binom.test(5, 18)

########################################################
# Vilkoksonov test oznacenog rangiranja  
########################################################
# Bez pretpostavke da se podaci u okviru sa podacima immer
# uklapaju u normalnu raspodelu, odrediti sa nivoom 
# znacajnosti 0.05 da li prinosi u 1931 i 1932 imaju
# identicnu distribuciju podataka.
# Nulta hipoteza je da su prinos iz te dve godine identicne
# populacije. 
# Da bi se to testiralo, primenjuje se f-ja
# wilcox.test, pri cemu se izvrsava upareni test.
# Ako je p-vrednost manja od nivoa znacajnosti tada treba
# odbaciti nultu hipotezu
library(MASS)
prinos.1931 <- immer$Y1
prinos.1932 <- immer$Y2
wilcox.test( prinos.1931, prinos.1932,
        paired = TRUE)

########################################################
# Men-Vitni-Vilkoksonov test  
########################################################
# Bez pretpostavke da podaci iz mtcars prate normalnu
# raspodelu, odrediti sa nivooom znacajnosti 0.05 
# da li potrosnje goriva kod automobila sa
# rucnim menjacem i automobila sa automaskim menjacem
# imaju identicnu raspodelu podataka.
# Nulta hipoteza je da potrosnje goriva kod automobila sa
# rucnim menjacem i automobila sa automaskim menjacem
# predstavljaju identicne populacije.
# Da bi se to testiralo, primenjuje se f-ja wicox.test da
# bi se uporedili nezavisni uzorci.
# Ako je p-vrednost manja od praga znacajnosti, nulta
# hipoteza se odbacuje.
library(datasets)
wilcox.test( mpg ~ am, data = mtcars)

########################################################
# Kruskal-Volisov test  
########################################################
# Okvir sa podacima airquality
library(datasets)
airquality
help(airquality)
head(airquality)

# Bez pretpostavke da podaci o nivou ozona u okviru airquality
# prate normalnu raspodelu, testirati sa nivoom znacajnosti
# 0.05 da li je identicna raspodela podataka za tu velicinu od
# maja do septembra 1973.
# Nulta hipoteza je da mesecni nivoi ozona jesu identicne populacije.
# Da bi se to testiralo, primenjuje se f-ja kruskal.test
# Ako je p-vrednost manja od nivoa znacajnosti, tada 
# treba odbaciti nultu hipotezu
library(datasets)
kruskal.test( Ozone ~ Month, data = airquality)
