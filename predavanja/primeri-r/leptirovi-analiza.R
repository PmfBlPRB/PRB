# Citanje podataka iz .csv datoteke
podaci <- read.csv("D:\\Temp\\leptirovi.csv", 
                   header = TRUE, 
                   sep = ",", 
                   dec = ".")
#podaci

prosecna.temperatura <- mean(podaci$temperatura)
prosecna.temperatura
prosecno.padavina <- mean(podaci$padavine)
prosecno.padavina
prosecno.insekata <- mean(podaci$insekata)
prosecno.insekata

medijana.temperatura = median(podaci$temperatura)
medijana.temperatura

kvartili <- quantile(podaci$temperatura)
kvartili

raspodela <- quantile(podaci$temperatura, c(0, 0.35, 0.75, 1 ))
raspodela

var(podaci$insekata)
sd(podaci$insekata)

korelacija.temperatura.padavine <- 
  cor(podaci$temperatura, podaci$padavine)
korelacija.temperatura.padavine

korelacija.temperatura.insekata <- 
  cor(podaci$temperatura, podaci$insekata)
korelacija.temperatura.insekata

korelacija.padavine.insekata <- 
  cor(podaci$padavine, podaci$insekata)
korelacija.padavine.insekata

raspodela2 <-quantile(podaci$temperatura, 
                      c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7 , 0.8, 0.9, 1))
raspodela2 

iqr <- IQR(podaci$temperatura)
iqr

boxplot(podaci$temperatura)


kvartili <- quantile(podaci$insekata)
kvartili
boxplot(podaci$insekata, horizontal = TRUE)
