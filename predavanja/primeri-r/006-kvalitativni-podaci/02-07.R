proseci <-  tapply(painters$Composition, 
                   painters$School, mean)
proseci
barplot(proseci)

najvece <-  tapply(painters$Composition, 
                   painters$School, max)
najvece
barplot(najvece)
