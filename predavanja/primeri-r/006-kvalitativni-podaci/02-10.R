hist(faithful$eruptions, right=FALSE)

hist(faithful$eruptions,
     breaks = seq(1.5, 5.5, 0.2),
     right=FALSE)

hist(faithful$waiting, right=FALSE)

hist(faithful$waiting,
      breaks = seq(40,100,3),
      right=FALSE)


hist(faithful$waiting,
     breaks = seq(40,100,5),
     col = c("red","blue","white", "yellow", 
              "cyan", "magenta"),
     main = "Cekanje",
     xlab="trajanje",
     ylab="frekfencija",
     right=FALSE)
