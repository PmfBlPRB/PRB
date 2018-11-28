# Liste
brojke <- c(23.5, 4.7, 6.3, 12.45, 0.37)
imena <- c("Pera", "Mika", "Laza")
pripada <- c(TRUE, TRUE, FALSE, TRUE)
lista <- list( brojke, 2+3i, imena, 
               pripada, 5, "Svasta")
lista

podlista <- lista[3]
podlista
treci.element <- lista[[3]]
treci.element

podlista <- lista[c(4,3,1)]
podlista

brojke <- c(23.5, 4.7, 6.3, 12.45, 0.37)
imena <- c("Pera", "Mika", "Laza")
pripada <- c(TRUE, TRUE, FALSE, TRUE)
lista <- list( brojke, 2+3i, imena, 
               pripada, 5, "Svasta")
lista

lista[[2]] <- c(1,2,3)
lista[[3]][3] <- "Luka"
lista

brojke <- c(23.5, 4.7, 6.3, 12.45, 0.37)
imena <- c("Pera", "Mika", "Laza")
pripada <- c(TRUE, TRUE, FALSE, TRUE)
lista <- list( numbers = brojke, 
               complex = 2+3i, 
               names = imena, 
               belongs = pripada)
lista

lista$complex <- 4
lista$names[3] <- "Peter"
lista

