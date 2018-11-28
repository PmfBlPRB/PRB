# matrice

elementi <- c(2,4,3,1,5,7)
prva <- matrix( elementi,
                nrow = 2,
                ncol =3,
                byrow = TRUE)
prva

druga <- matrix( elementi,
                nrow = 2,
                ncol =3,
                byrow = FALSE)
druga

treca <- matrix( elementi,
                 nrow = 2,
                 ncol =3)
treca

           
# indeksiranje
na.poziciji.2.2 <- druga[2,2]
na.poziciji.2.2

prva
prva.vrsta.od.prva <- prva[1,]
prva.vrsta.od.prva
druga.kolona.od.prva <- prva[,2]
druga.kolona.od.prva

matrica.A <- matrix(
  c(1,2,3,4,5),
  nrow = 4,
  ncol = 3)
matrica.A

podmatrica.A <- matrica.A[c(2,4), c(1,3)]
podmatrica.A

zamenili.prvu.i.trecu.kolonu <- matrica.A[,c(3,2,1)]
zamenili.prvu.i.trecu.kolonu

matrica.A[2,2] <- 22
matrica.A

matrica.A[2,] <- c(7,8,9)
matrica.A

matrica.A[,2] <- c(0.5,1.5)
matrica.A

matrica.A <- matrix(
  c(1,2,3,4,5,6),
  nrow = 4,
  ncol = 3)
matrica.A
dimnames(matrica.A) <- list(
  c("najvisa","skoro najvisa", "skoro najniza", "najniza"),
  c("prva", "druga", "treca")
  )
matrica.A

treca.vrsta.matrice.A <- matrica.A["skoro najniza",]
treca.vrsta.matrice.A

# operacije nad matricama
elementi <- c(2,4,3,1,5,7)
prva <- matrix( elementi,
                nrow = 2,
                ncol =3,
                byrow = TRUE)
prva
druga <- matrix( elementi,
                 nrow = 2,
                 ncol =3,
                 byrow = FALSE)
druga
zbir <- prva + druga

prva
transponovana.prva <- t(prva)
transponovana.prva

prva
druga
spojene.po.koloni <- cbind (prva, druga)
spojene.po.koloni

prva
druga
spojene.po.vrsti <- rbind (prva, druga)
spojene.po.vrsti


