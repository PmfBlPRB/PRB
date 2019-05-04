# Citanje podataka iz .csv datoteke
leptiri <- read.csv("D:\\Course\\PmfBlPRB--PRB\\predavanja\\primeri-r\\leptirovi.csv", 
                   header = TRUE, 
                   sep = ",", 
                   dec = ".")
#leptiri

prosecna.temperatura <- mean(leptiri$temperatura)
prosecna.temperatura

prosecno.padavina <- mean(leptiri$padavine)
prosecno.padavina

prosecno.insekata <- mean(leptiri$insekata)
prosecno.insekata

medijana.temperatura = median(leptiri$temperatura)
medijana.temperatura

kvartili <- quantile(leptiri$temperatura)
kvartili

raspodela <- quantile(leptiri$temperatura, c(0, 0.35, 0.75, 1 ))
raspodela

var(leptiri$insekata)
sd(leptiri$insekata)

korelacija.temperatura.padavine <- 
  cor(leptiri$temperatura, leptiri$padavine)
korelacija.temperatura.padavine

korelacija.temperatura.insekata <- 
  cor(leptiri$temperatura, leptiri$insekata)
korelacija.temperatura.insekata

korelacija.padavine.insekata <- 
  cor(leptiri$padavine, leptiri$insekata)
korelacija.padavine.insekata

raspodela2 <-quantile(leptiri$temperatura, 
                      c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7 , 0.8, 0.9, 1))
raspodela2 

iqr <- IQR(leptiri$temperatura)
iqr

boxplot(leptiri$temperatura)


kvartili <- quantile(leptiri$insekata)
kvartili

boxplot(leptiri$insekata, horizontal = TRUE)

moment(leptiri$temperatura, order = 3, center = TRUE)
