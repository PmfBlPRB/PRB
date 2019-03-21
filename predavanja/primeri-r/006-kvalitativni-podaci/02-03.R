## Faza 1
painters


## Faza 2
skola <- painters$School
c.skola.uslov <- skola == "C"
c.skola.uslov

## Faza 3
c_skola <- painters$School == "C"
slikari.skole.c <- painters[c_skola,]
slikari.skole.c

## Faza 4
c_skola <- painters$School == "C"
slikari.skole.c <- painters[c_skola,]
slikari.skole.c$Composition

## Faza 5
c_skola <- painters$School == "C"
slikari.skole.c <- painters[c_skola,]
mean(slikari.skole.c$Composition)

