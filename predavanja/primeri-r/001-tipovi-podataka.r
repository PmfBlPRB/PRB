# Osnovni tipovi

# numeric
x <- 10.5
x
class(x)
y <- 4
class(y)
class(x+y)
is.numeric(x)

x <- as.numeric("62e-2")
x
x <- as.numeric( "six")
x
x <- as.numeric(TRUE)
x
x <- as.numeric(FALSE)
x
x <- as.numeric("FALSE")
x

#integer
x <- 4
is.integer(x)
y <- 4L
class(y)
is.integer(y)
class(x + y)
z <- as.integer(x)
class(z)
class(y+z)

x <- as.integer(4.13)
x
x <- as.integer(4.83)
x
x <- as.integer( round(4.83) )
x
x <- as.integer( "6")
x
x <- as.integer( "6.3")
x
x <- as.integer( "6.99")
x
x <- as.integer( "six")
x

# complex
x <- 2 + 3i
x
y <- 4+ 2i
y
z <- x + y
z
t <- x * y
t
class(x)

minus.1 <- as.complex(-1) # -1+0i
class(minus.1)
imaginarna.jedinica <- sqrt(minus.1)
imaginarna.jedinica

x <- as.complex( TRUE )
x
x <- as.complex( "434e1" )
x
x <- as.complex( "2+3i")
x

# logical
x <- 1; y <- 2
z <- x < y
z
class(z)

x <- TRUE
y <- FALSE
z <- x & y
z
t <- x | y
t
u <- !x
x
v <- !y
v

# character
x <- "Dobro vece!"
x
class(x)

x <- 12
y <- as.character(x)
y
x <- 12.43E1
y <- as.character(x)
y
x <- FALSE
y <- as.character(x)
y

x <- "Dobro"
y <- "vece"
z <- paste(x, y)
z
t <- paste(x, y, "dobri ljudi!")
t

# funkcija sprintf
x <- sprintf("Pevac %s ima %d hitova", "Zdravko Colic", 15)
x
pevac <- "Zdravko Colic"
broj <- 19
x <- sprintf("Pevac %s ima %d hitova", pevac, broj)
x

# funkcija substr - izdvajanje podniske iz niske
x <- "Ovo je jedna pametna recenica."
y <- substr(x, 5,10)
y
y <- substr(x, stop = 10, start = 5)
y

# funkcija sub - zamenjuje pdnisku sa drugom niskom
x <- "Ovo je jedna pametna recenica."
y <- sub( "pametna", "glupa", x)
y

# Vektori
x <- c(7,2,3,4)
x
x <- c(7L, 2L, 3L, 4L)
x
x <- c(7L, 2L, 3, 4L)
x
x <- c(7+2i, 2L, 3, 4L)
x
x <- c(7+2i, "2L", 3, 4L)
x


