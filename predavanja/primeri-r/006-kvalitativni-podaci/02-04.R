#Faza 1
painters

#Faza 2
kompozicija.ocene <- painters$Composition
kompozicija.ocene 


#Faza 3
kompozicija.ocene <- painters$Composition
kompozicija.ocene.broj <- table(kompozicija.ocene)
kompozicija.ocene.broj

#Faza 4
kompozicija.ocene <- painters$Composition
kompozicija.ocene.broj <- table(kompozicija.ocene)
pie(kompozicija.ocene.broj) 

#Faza 5
kompozicija.ocene <- painters$Composition
kompozicija.ocene.broj <- table(kompozicija.ocene)
moje.boje <- c("red", "blue", "white")
pie(kompozicija.ocene.broj, radius=0.5,
    col = moje.boje) 


#Faza 5
pie( table(painters$Composition), radius=0.9,
    col = c("red", "blue", "white", "purple", "green", "black")) 

