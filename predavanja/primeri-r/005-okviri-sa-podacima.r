mtcars

nrow(mtcars)
ncol(mtcars)

head(mtcars)
head(mtcars, n=3)

tail(mtcars)
tail(mtcars, n= 3)

x <- mtcars[4,3]
x
x <- mtcars["Hornet 4 Drive", "disp"]
x
x <- mtcars["Hornet 4 Drive",]$disp
x

y<- mtcars[[3]]
y
y<- mtcars[["disp"]]
y
y<- mtcars$disp
y

mtcars[[3]][2] <- 0
mtcars


filter <- (mtcars$cyl > 6) & (mtcars$am == 0)
filter
jaki.rucni <- mtcars[filter,]
jaki.rucni

filter <- (mtcars$cyl > 6) & (mtcars$am == 0)
filter
jaki.rucni <- mtcars[filter, c("cyl", "hp", "disp")]
jaki.rucni
