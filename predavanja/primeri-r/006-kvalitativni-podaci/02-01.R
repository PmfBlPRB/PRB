## Faza 1
painters

## Faza 2
ocena.kompozicija <- painters$Composition
ocena.kompozicija

## Faza 3
ocena.kompozicija <- painters$Composition
ocena.kompozicija.frekfencije <- table(ocena.kompozicija)
ocena.kompozicija.frekfencije

## Poslednja faza
ocena.kompozicija <- painters$Composition
ocena.kompozicija.frekfencije <- table(ocena.kompozicija)
barplot(ocena.kompozicija.frekfencije)