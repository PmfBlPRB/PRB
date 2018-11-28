
########################################################
# Uvod u R
########################################################
# Interpretiranje izraza
1 + 2


# Dodela i prikaz vrednosti promenljive
x = 10
x

y <- 12
y

y <- 12; y

# Kombinovanje vrednosti u vektor
z <- c(1,2,3)
z

t <- c(1, 1.2, "Miki", "Maus", z, z)
t # uocava se da su svi podaci u vektoru "ispeglani"

# Poziv dokumentacije za funkciju c
help(c) 

# Poziv dokumentacije za funkciju c (alternativni nacin)
? c  

########################################################
# Numeric
########################################################
# Prikaz vrednosti i klase za "realni" broj
x <- 10.5
x
class(x)

# Prikaz vrednosti i klase za "ceo" broj 
x <- 1
x
class(x)

# Provera da li je broj ceo
x <- 1
is.integer(x)


########################################################
# Integer
########################################################
# Kreiranje celog broja 
x <- as.integer(12)
x
class(x)
is.integer(x)

# Konverzija iz realnog u ceo broj
x <- as.integer(3.14)
x
class(x)

# Konverzija iz niske koja opisuje broj u ceo broj
x <- as.integer("5.27")
x
class(x)

# Konverzija iz niske koja ne opisuje broj u ceo broj
x <- as.integer("Mitar Miric")
x
class(x)

# Logicki tip i konverzija logicke konstante u ceo broj
x <- TRUE
x
class(x)
x <- as.integer(TRUE)
x
class(x)
y <- FALSE
y
class(y)
y <- as.integer(FALSE)
y
class(y)

########################################################
# Complex
########################################################
# Kompleksni tip
z <- 2+3i
z
class(z)

# Kvadratni koren realnog broja -1 ne postoji
z <- sqrt(-1)
z

# Kvadratni koren kompleksnog broja -1 postoji
z <- sqrt(-1+0i)
z

# Alternativni nacin za izracunavanje kvardratnog korena 
# kompleksnog broja -1
z <- sqrt(as.complex(-1))
z

########################################################
# Logical
########################################################
# Poredjenjem brojeva dobija se logicka vrednost
x <- 1
y <- 2
z <- x < y
z
class(z)

# Logical operations
u <- TRUE
v <- FALSE
u & v
z <- u | v
z
!u

########################################################
# Character
########################################################
# Konverzija u nisku
x <- as.character(3.14)
x
class(x)

# Slepljivanje niski
ime <- "Mitar" prezime <- "Miric"
x <- paste(ime, prezime)
x
y <- paste(prezime, ime, "Umetnik", sep = "+")
y

# Formatiranje niski
ime <- "Mitar"
x <- sprintf("%s zaradjuje %d po nastupu", ime, 300)
x
class(x)

# Izvlacenje podniske iz niske
poruka <- "Mary has a little lamb"
substr(poruka, start = 3, stop = 12)

# Zamena delova u niski
poruka <- "Mary has a little lamb"
sub("little", "big", poruka)

########################################################
# Sekvenca
########################################################
# Kreiranje sekvence celih brojeva
v <- 3:50
v
class(v)

########################################################
# Vektor
########################################################
# Kreiranje vektora od brojeva
v <- c(2, 3, 5)
v

########################################################
# Kombinovanje vektora
########################################################
# Kreiranje vektora od logickih vrednosti
v <- c(TRUE, FALSE, TRUE, FALSE, FALSE)
v

# Kreiranje vektora od niski
v <- c("Mary", "has", "a", "little", "lamb")
v

# Odredjivanje duzine vektora
v <- c("Mary", "has", "a", "little", "lamb")
length(v)

# Kombinovanje dva vektora u vektor opstijeg tipa
u <- c(2, 3, 5)
v <- c("Mary", "has", "a", "little", "lamb")
t <- c(u, v)
t

########################################################
# Aritmeticke operacije nad vektorima
########################################################
# Aritmeticke operacije nad vektorima
x <- c(1, 3, 5, 7)
y <- c(1, 2, 4, 8)
z <- 5 * x
z
z <- x + y
z
z <- x - y
z
z <- x * y
z
z <- x / y
z

# Aritmeticke operacije nad vektorima razlicite duzine
x <- c(10, 20, 30)
y <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
z <- x + y
z

########################################################
# Indeksi kod vektora
########################################################
# Pristup elementu vektora preko indeksa 
v <- c("Mary", "has", "a", "little", "lamb")
v
t <- v[3]
t

# Uklanjanje elementa vektora koriscenjem negativnog indeksa 
v <- c("Mary", "has", "a", "little", "lamb")
v
t <- v[-3]
t

# Sta se desava kad indeks iyadje van opsega?
v <- c("Mary", "has", "a", "little", "lamb")
v
t <- v[13]
t

# Pristup elementima vektora preko vektora celobrojnih indeksa 
v <- c("Mary", "has", "a", "little", "lamb")
v
t <- v[c(2, 4)]
t

# Pristup elementima vektora preko vektora celobrojnih indeksa, 
# koji se mogu ponavljati 
v <- c("Mary", "has", "a", "little", "lamb")
v
t <- v[c(2, 4, 4)]
t

# Pristup elementima vektora preko vektora celobrojnih indeksa, 
# koji se mogu ponavljati
# i koji ne koraju biti poredjani po redosledu
v <- c("Mary", "has", "a", "little", "lamb")
v
t <- v[c(4, 2, 4)]
t

# Pristup elementima vektora preko sekvence celobrojnih indeksa
v <- c("Mary", "has", "a", "little", "lamb")
v
t <- v[c(2:4)]
t

# Pristup elementima vektora preko vektora logickih indeksa
v <- c("Mary", "has", "a", "little", "lamb")
v
l <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
l
t <- v[l]
t

########################################################
# Imenovani elementi u vektoru
########################################################
# Imenovanje koordinata vektora
v <- c("Mitar", "Miric", 1958)
v
names(v) <- c("Ime", "Prezime", "Godina rodjenja")
v
v["Prezime"]
v[c("Prezime", "Ime")]

########################################################
# Matrice 
########################################################
# Kreiranje i prikaz matrice
a <- matrix(c(2, 4, 3, 1, 5, 7), 
             nrow = 2, # broj vrsta
             ncol = 3, # broj kolona
             byrow = TRUE) # vrednosti se smestaju vrsta po vrsta
a
class(a)

# Pristup elementima matrice
a <- matrix(c(2, 4, 3, 1, 5, 7), 
             nrow = 2, ncol = 3, byrow = TRUE) 
a[2,3] # element na poziciji 2,3 - u drugoj vrsti i trecoj koloni
class(a[2,3])
a[2,] # elementi u drugoj vrsti
class(a[2,])
a[,3] # elementi u trecoj koloni
class(a[,3])
a[,c(1,3)] # elementi u prvoj i trecoj koloni
class(a[,c(1,3)])

# Imenovanje vrsta i kolona u matrici
a <- matrix(c(2, 4, 3, 1, 5, 7), 
             nrow = 2, ncol = 3, byrow = TRUE) 
dimnames(a) <- list(
  c("Prva vrsta", "Druga vrsta"),
  c("Prva kolona", "Druga kolona", "Treca kolona"))
a

# Pristup elementima matrice preko imena vrsta i kolona
a <- matrix(c(2, 4, 3, 1, 5, 7), 
             nrow = 2, ncol = 3, byrow = TRUE) 
dimnames(a) <- list(
  c("Prva vrsta", "Druga vrsta"),
  c("Prva kolona", "Druga kolona", "Treca kolona"))
a["Prva vrsta", "Druga kolona"]

########################################################
# Kreiranje i prikaz matrice
########################################################
# (podrazumevano se vrednosti smestaju kolona po kolona)
b <- matrix(c(2, 4, 3, 1, 5, 7), nrow = 2, ncol = 3)
b

# Transponovanje matrice
b <- matrix(c(2, 4, 3, 1, 5, 7), nrow = 2, ncol = 3)
b
c <- t(b)
c

# Spajanje matrica nadovezivanjem kolona 
# Matrice koje se spajaju imaju isti broj vrsta
b <- matrix(c(2, 4, 3, 1, 5, 7), nrow = 3, ncol = 2)
b
c <- matrix(c(7, 4, 2), nrow = 3, ncol = 1)
c
d <- cbind(b, c)
d

# Spajanje matrica nadovezivanjem vrsta 
# Matrice koje se spajaju imaju isti broj vrsta
b <- matrix(c(2, 4, 3, 1, 5, 7), nrow = 3, ncol = 2)
b
c <- matrix(c(6, 2), nrow = 1, ncol = 2)
c
d <- rbind(b, c)
d

# Kreiranje vektora od matrice
# (podrazumevano se vrednosti smestaju kolona po kolona)
b <- matrix(c(2, 4, 3, 1, 5, 7), nrow = 3, ncol = 2)
b
c <- c(b)
c
 
########################################################
# Liste
########################################################
# Kreiranje liste sa raznorodnim elementima
n <- c(2, 3, 5)
s <- c("aa", "bb", "cc", "dd", "ee")
b <- c(TRUE, FALSE, TRUE, FALSE, FALSE)
x <- list(n, s, b, 3) # x sadrzi kopije od n, s, b
x

# Isecanje liste (dobijeni isecak je nova lista)
x <- list(c(2, 3, 5),
          c("aa", "bb", "cc", "dd", "ee"),
          c(TRUE, FALSE, TRUE, FALSE, FALSE),
          3)
y <- x[2] # isecak liste koji sadrzi elemenat u na poziciji 2
y
class(y)
z <- x[c(4,2)] # isecak liste koji sadrzi elemente na pozicijama 4 i 2
z
class(z)

# Pristup elementima liste
x <- list(c(2, 3, 5),
          c("aa", "bb", "cc", "dd", "ee"),
          c(TRUE, FALSE, TRUE, FALSE, FALSE),
          3)
y <- x[[2]] # elemenat u na poziciji 2
y
class(y)

# Modifikacija elemenata liste
x <- list(c(2, 3, 5),
          c("aa", "bb", "cc", "dd", "ee"),
          c(TRUE, FALSE, TRUE, FALSE, FALSE),
          3)
x
x[[2]][1] <- "Mitar" 
x

########################################################
# Imenovani elementi liste
########################################################
# Imenovanje elemenata liste
v <- list(nagrade=c(2, 3, 5), ime=c("Mitar", "Miric"))
v

# Isecanje liste pomocu imenovanih elemenata
v <- list(nagrade=c(2, 3, 5), ime=c("Mitar", "Miric"))
v["nagrade"]
v[c("ime","nagrade")]

# Pristup elementima liste pomocu imenovanih elemenata
v <- list(nagrade=c(2, 3, 5), ime=c("Mitar", "Miric"))
v[["nagrade"]] # Prvi nacin
v$nagrade # Drugi nacin

# Pridruzivanje liste R putanji za pretragu
v <- list(nagrade=c(2, 3, 5), ime=c("Mitar", "Miric"))
attach(v)
ime

# Razdruzivanje liste od putanje za pretragu
detach(v)

########################################################
# Okvir sa podacima
########################################################
# Kreiranje okvira sa podacima
n <- c(2, 3, 5)
s <- c("aa", "bb", "cc")
b <- c(TRUE, FALSE, TRUE)
df <- data.frame(n, s, b) 
df

# Prikaz raspolozivog okvira sa podacima mtcars
mtcars

# Pristup podacima u okviru preko indeksa
mtcars[1,4]

# Pristup podacima u okviru preko imena vrste i kolone
mtcars["Mazda RX4","hp"]

# Broj vrsta u okviru sa podacima
nrow(mtcars)

# Broj kolona u okviru sa podacima
ncol(mtcars)

# Informacije o okviru sa podacima mtcars
help(mtcars)

# Prikaz zaglavlja okvira sa podacima mtcars
head(mtcars)

########################################################
# Vektor-kolona u okviru sa podacima 
########################################################
# Izdvajanje vektora-kolone iz okvira sa podacima na 
# osnovu indeksa
mtcars[[4]]

# Izdajanje vektora-kolone iz okvira na osnovu imena kolone
mtcars[["hp"]] # prvi nacin
mtcars$hp # drugi nacin
mtcars[,"hp"] # treci nacin


########################################################
# Isecanje kolone iz okvira sa podacima 
########################################################
# Isecanje okvira sa datom kolonom, na osnovu indeksa kolone
mtcars[4]

# Isecanje okvira sa datom kolonom, na osnovu imena kolone
mtcars["hp"]

# Isecanje okvira sa datim kolonama, na osnovu imena kolone
mtcars[c("hp", "mpg", "cyl")]

########################################################
# Isecanje vrste iz okvira sa podacima 
########################################################
# Isecanje okvira sa datom vrstom, na osnovu indeksa vrste
mtcars[24, ]

# Isecanje okvira sa datim vrstama, na osnovu indekasa vrsta
mtcars[c(24, 23, 1, 3), ]

# Isecanje okvira sa datom vrstom, na osnovu imena vrste
mtcars["Camaro Z28", ]

# Isecanje okvira sa datim vrstama, na osnovu imena vrsta
mtcars[c("Camaro Z28", "Mazda RX4"), ]

# Isecanje okvira indeksiranjem pomocu logickog vektora
condition <- mtcars$hp >= 250
condition
x <- mtcars[condition,]
x
class(x)

# Izdvajanje potrosnje (mpg) indeksiranjem pomocu logickog vektora
condition <- mtcars$hp >= 250
x <- mtcars[condition,]$mpg
x
class(x)

