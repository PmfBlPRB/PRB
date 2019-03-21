## Faza 1
painters

## Faza 2
uslov.skola.je.C <- painters$School == "C"
uslov.skola.je.C

## Faza 3
uslov.skola.je.C <- painters$School == "C"
samo.skola.C <- painters[uslov.skola.je.C, ]
samo.skola.C

## Faza 4
uslov.skola.je.C <- painters$School == "C"
samo.skola.C <- painters[uslov.skola.je.C, ]
samo.skola.C.ocena.kompozicija <-
   samo.skola.C$Composition
samo.skola.C.ocena.kompozicija

# Faza 5
uslov.skola.je.C <- painters$School == "C"
samo.skola.C <- painters[uslov.skola.je.C, ]
samo.skola.C.ocena.kompozicija <-
  samo.skola.C$Composition
mean(samo.skola.C.ocena.kompozicija)

# Faza 6
mean(painters[ painters$School == "C", ]$Composition)

