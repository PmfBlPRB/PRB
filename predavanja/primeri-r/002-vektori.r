vektor.A <- c(2,3,5,7)
vektor.A 

vektor.B <- c( TRUE, FALSE, FALSE)
vektor.B

imena <- c( "Pera", "Mika", "Zika")
imena

x<- length(imena)
x

vektor.C = c( 12.5,7.8, 9, 4, -2)
vektor.C

vektor.D <- c( vektor.C, vektor.A)
vektor.D
vektor.E <- c(vektor.D, vektor.D )
vektor.E

vektor.A <- c(2,3,5,7)
vektor.A 
vektor.B <- c( TRUE, FALSE, FALSE)
vektor.B
c(vektor.A, vektor.B)

vektor.A <- c(2,3,5,7)
vektor.A 
imena <- c( "Pera", "Mika", "Zika")
imena
c(vektor.A, vektor.B, imena)

# operacije
vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
vektor.B <- c(12.1,13,15,17,18, 16)
vektor.B
zbir <- vektor.A + vektor.B
zbir
razlika <- vektor.A - vektor.B
razlika

vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
vektor.B <- c(TRUE,TRUE,TRUE,TRUE,FALSE,TRUE)
vektor.B
proizvod <- vektor.A * vektor.B
proizvod

vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
vektor.B <- c("TRUE","a","b","c","d", "e")
vektor.B
proizvod <- vektor.A * vektor.B
proizvod

vektor.A <- c(2,3,5,7,9, 16.3)
rezultat <- 2 * vektor.A
rezultat
rezultat <- vektor.A * 2
rezultat

vektor.A <- c(2, 3, 5, 7, 9, 16.3)
vektor.A
vektor.B <- c(12.1, 13)
vektor.B
zbir <- vektor.A + vektor.B
zbir

# indeksiranje vektora
vektor.A <- c(2,3,5,7)
drugi.clan.A <- vektor.A[2] 
drugi.clan.A

vektor.A <- c(2,3,5,7)
bez.drugog.clana.A <- vektor.A[-2] 
bez.drugog.clana.A

vektor.A <- c(2,3,5,7)
x <- vektor.A[12]
x

vektor.A <- c(2,3,5,7,9)
vektor.A
drugi.i.cetvrti.A <- vektor.A[c(2,4)]
drugi.i.cetvrti.A

vektor.A <- c(2,3,5,7,9)
vektor.A
cetvrti.peti.i.drugi.A <- vektor.A[c(4,5,2)]
cetvrti.peti.i.drugi.A

vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
od.drugog.do.petog.A <- vektor.A[c(2,3,4,5)]
od.drugog.do.petog.A

vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
od.drugog.do.petog.A <- vektor.A[2:5]
od.drugog.do.petog.A

vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
vektor.A[6] <- 22
vektor.A

vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
vektor.A[4:6] <- c(3,4,22)
vektor.A

vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
vektor.A[4:6] <- c(3,4,22, 23)
vektor.A


vektor.A <- c(2,3,5,7,9, 16.3)
vektor.A
vektor.A[4:6] <- c(3,4)
vektor.A


# filter preko logickih vrednosti
vektor.A <- c(2, 3, 5, 7, 9, 16.3)
vektor.A
filter <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE)
filter
prepisani <- vektor.A[filter]
prepisani

vektor.A <- c(2, 3, 5, 7, 9, 16.3, 22)
vektor.A
filter <- c(TRUE, FALSE)
filter
prepisani <- vektor.A[filter]
prepisani

vektor.A <- c(12, 3, 5, 4, 19, 6, 2)
vektor.A
filter <- vektor.A >= 5
filter
ne.manji.od.5.iz.A <- vektor.A[filter]
ne.manji.od.5.iz.A

vektor.A <- c(12, 3, 5, 4, 19, 6, 2)
vektor.A
filter <- (vektor.A >= 5) & (vektor.A <=10)
filter
rez <- vektor.A[filter]
rez

trojka <- c(23, 45, 78)
trojka
names(trojka) <- c("levi", "srednji", "desni")
trojka

x <- trojka["levi"]
x

trojka["desni"] <- TRUE
trojka

x <- "srednji"
trojka[x] <- 22.4
trojka