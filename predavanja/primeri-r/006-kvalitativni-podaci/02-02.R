## Faza 1
painters

## Faza 2
ocena.kompozicija <- painters$Composition
ocena.kompozicija

## Faza 3
ocena.kompozicija <- painters$Composition
ocena.kompozicija.frekfencije <- table(ocena.kompozicija)
ocena.kompozicija.frekfencije

## Faza 4
ocena.kompozicija <- painters$Composition
ocena.kompozicija.frekfencije <- table(ocena.kompozicija)
ocena.kompozicija.relativne.frekfencije <- 
  ocena.kompozicija.frekfencije / sum(ocena.kompozicija.frekfencije)
ocena.kompozicija.relativne.frekfencije

## Faza 5
ocena.kompozicija <- painters$Composition
ocena.kompozicija.frekfencije <- table(ocena.kompozicija)
ocena.kompozicija.relativne.frekfencije <- 
  ocena.kompozicija.frekfencije / sum(ocena.kompozicija.frekfencije)
pie(ocena.kompozicija.relativne.frekfencije)

