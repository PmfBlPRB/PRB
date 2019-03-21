
uslov.skola <- painters$School == "C"
samo.skola <- painters[uslov.skola, ]
samo.skola.ocena.kompozicija <-
  samo.skola$Composition
mean(samo.skola.ocena.kompozicija)

proseci <- c(
  mean(painters[ painters$School == "A", ]$Composition),
  mean(painters[ painters$School == "B", ]$Composition),
  mean(painters[ painters$School == "C", ]$Composition),
  mean(painters[ painters$School == "D", ]$Composition),
  mean(painters[ painters$School == "E", ]$Composition),
  mean(painters[ painters$School == "F", ]$Composition),
  mean(painters[ painters$School == "G", ]$Composition),
  mean(painters[ painters$School == "H", ]$Composition)
)
proseci

barplot(proseci)