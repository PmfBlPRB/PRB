trajanja <- faithful$eruptions
cekanja <- faithful$waiting

sredina.trajanja <- sum(trajanja)/length(trajanja)
sredina.trajanja
sredina.trajanja <- mean(trajanja)
sredina.trajanja

sredina.cekanja <- mean(cekanja)
sredina.cekanja

mediana.trajanja <- median(trajanja)
mediana.trajanja

mediana.cekanja <- median(cekanja)
mediana.cekanja

kvartili.trajanja <- quantile(trajanja)
kvartili.trajanja

kvartili.trajanja <- quantile(trajanja, c(0,0.25,0.5,0.75,1) )
kvartili.trajanja

percentili.trajanja <- quantile(trajanja, 
    c(0,0.1,0.2,0.3,0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1) )
percentili.trajanja

opseg.trajanja <- range(trajanja)[2] - range(trajanja)[1]
opseg.trajanja
opseg.trajanja <- max(trajanja) - min(trajanja)
opseg.trajanja

opseg.medju.kvartilima.trajanja <- IQR(trajanja)
opseg.medju.kvartilima.trajanja

boxplot(trajanja)

disperzija.trajanja <- var(trajanja)
disperzija.trajanja

standardna.devijacija.trajanja <- sqrt(var(trajanja))
standardna.devijacija.trajanja
standardna.devijacija.trajanja <- sd(trajanja)
standardna.devijacija.trajanja

kovarijansa.cekanja.i.trajanja = cov(cekanja, trajanja)
kovarijansa.cekanja.i.trajanja

koeficiejnat.korelacije.cekanja.i.trajanja <-  cor(cekanja, trajanja)
koeficiejnat.korelacije.cekanja.i.trajanja

filter.kratko <- faithful$eruptions < 3
filter.kratko
podaci.kratko <- faithful[filter.kratko,]
podaci.kratko
cor(podaci.kratko$waiting, podaci.kratko$eruptions)



