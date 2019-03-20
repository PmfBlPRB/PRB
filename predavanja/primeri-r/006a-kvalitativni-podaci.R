# Okvir sa podacima koji se proucava 
faithful

# Sredina 
srednje.trajanje.erupcije <- mean(faithful$eruptions)
srednje.trajanje.erupcije

srednje.cekanje <- mean(faithful$waiting)
srednje.cekanje

# Medijana
medijana.trajanja.erupcije <- median(faithful$eruptions)
medijana.trajanja.erupcije

medijana.cekanja <- median(faithful$waiting)
medijana.cekanja

# Medijana je manje osetljiva na "outliner-e"
sva.cekanja <- faithful$waiting
sva.cekanja
srednje.cekanje <- mean(sva.cekanja)
srednje.cekanje
medijana.cekanja <- median(sva.cekanja)
medijana.cekanja
sva.cekanja <- c(sva.cekanja, 3000 ) # dodali smo 3000 u sva.cekanja
sva.cekanja
srednje.cekanje <- mean(sva.cekanja)
srednje.cekanje
medijana.cekanja <- median(sva.cekanja)
medijana.cekanja

# Mod
broj.pojava <- table(sva.cekanja)
broj.pojava
sortiran.broj.pojava <- sort(broj.pojava, decreasing = TRUE) 
sortiran.broj.pojava

# Disperzija i standardna devijacija
disperzija.cekanje <- var(sva.cekanja)
disperzija.cekanje
stanadrdna.devijacija.cekanje <- sd(sva.cekanja)
stanadrdna.devijacija.cekanje

kovarijansa.trajanje.cekanje <- 
  cov (faithful$eruptions, faithful$waiting)
kovarijansa.trajanje.cekanje

korelacija.trajanje.cekanje <- 
  cor (faithful$eruptions, faithful$waiting)
korelacija.trajanje.cekanje

