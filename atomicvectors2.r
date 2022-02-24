# A whole bunch more about atomic vectors
#10 Feb 2022
#RCS

#How to create an empty vector + add to it (DON'T DO THIS)

z <- vector(mode = 'numeric', length = 0)
z
c(z,5)
z <- c(z,5)
print(z)

#create a vector of predetermined length (DO THIS INSTEAD)
#create a vector of 100 zeroes

z <- rep(0,100)
head(z)
tail(z)

#better to build a vector of NAs
z <- rep(NA,100)
head(z)
typeof(z)
z[1] <- 'Washington'
typeof(z)

my_vector <- runif(1000)
head(my_vector)
my_names <- paste('Species',seq(1:length(my_vector)), sep='_')
head(my_names)

names(my_vector) <- my_names
head(my_vector)

#using rep to repeat elemetns and create vectors
rep(0.5,6) #give the element/vector + the number of times to repeat it

rep(x=0.5,times=6) #same function, but a bit more readable
rep(time=6,x=0.5)
rep(6,0.5) #doesn't work
my_vec <- c(1,2,3)
rep(x=my_vec,times=2)
rep(x=my_vec,each=2)
rep(x=my_vec, times=my_vec)
rep(x=my_vec,each=my_vec)

#use seq function to create regular sequences
seq(from=2, to=1)
2:4
4:2
seq(from=2,to=4,by=0.5)
seq(from=2,to=4,length=7)
my_vec <- 1:length(z)
seq_along(my_vec)
seq_len(100)

#Random numbers in r
#uniform distribution
runif(5) #generates 5 random numbers along a uniform distribution between 0 and 1
runif(n=3,min=100,max=110) #generates 3 random numbers between 100 and 110
#normal distribution
rnorm(6) #generates 6 numbers on a normal dist w/ mean = 0 and sd =1
rnorm(n=5,mean=100,sd=30)
library(ggplot2)
z <- runif(1000)
qplot(x=z) #hist of z
z <- rnorm(1000)
qplot(x=z)

#sample r.v's from a vector
long_vec <- seq_len(10)
typeof(long_vec)
sample(long_vec)
sample(x=long_vec,size=3)
sample(x=long_vec,size=3,replace=TRUE)
dice <- 1:6
sample(x=dice,size=1)
my_weights <- c(1,1,1,1,10,10)
equal_weights <- rep(1,6)
sample(x=dice,replace = TRUE, prob=my_weights)
sample(x=dice,replace = TRUE, prob=equal_weights)


#Techniques for subsetting atomic vectors
z <- c(3.1,9.2,1.3,0.4,0.75)

#use positive index values
z[3]
z[c(2,4)]
z[c(5,5,5,1)]
z[-3]
z[z<3]
which(z<3) #tells you the place of particular slots/conditions
z[which(z<3)]
z[-(length(z):length(z-2))]
#subsetting using names of elements
names(z) <- letters[1:5]
print(z)
z[c('b','c')]

#relational operators
# >
# <
# <=
# >=
# ==

#logical operators
# ! not
# & and (vector)
# | or
# xor(x,y) one or the other - not both
# && and (only on first element)
# || or (only on first element)

x <- 1:5
y <- c(1:3,7,7)
x == 2
x != 2
x == 1 & y == 7
x == 1 | y ==7
xor(x == 3,y == 3)
x == 3 && y ==3

#subscripting w/ missing values#
set.seed(90)
z <- runif(10)
z
z < 0.5
z[z < 0.5]
which(z < 0.5)
z[which(z < 0.5)]

zD <- c(z,NA,NA)
zD
zD[zD < 0.5]
zD[which(zD < 0.5)]
