#Class script to introduce atomic vectors
#02/08/2022
#RCS

#Using the assignment operator
x <- 5
x <- 3+3
y = 4 #legal but not best
y = y + 1.1
print(y)

#Naming variables
x <- 3
plantHeight <- 10 #camelCaseformatting
plant.height <- 9 #collides with other r format
plant_format <- 3 #snake_case_formatting. supposedly most readable
. <- 5.5 #reserve for a generic, temp holding variable
z <- . #for passing

#data types in R are organized by dimensions
#1 dimension
#2 dimensions
#n dimensions

#data are either homogenous or hetergenous
#see class notes for more discussion

#one dimensional atomic vectors

#the combine (or concatenate) function
z <- c(3.2,5,5,6)
print(z)

typeof(z) #tells you type of variable
is.numeric(z) #tells you whether a variable is numeric
is.character(z) #tells you whether a variable is character

#C always *flattens* elements*
z <- c(c(3,4),c(5,6))
z

#character string braceted w/ " or '
z <- c('perch','bass','trout')
z

#quotes can be imbedded
z <- c("This is only 'one' character string", "another character 'string'")
z

#building logicals / boolean variables
z <- c(TRUE, TRUE, FALSE)
typeof(z)
is.logical(z)
is.integer(z)

#length tells how many elements
length(x)
length(z)
#length(Z) #not found because Z (capitol) doesn't exist

#Names of vector elements
#Optional attribute - a form of metadata
z <- runif(5)
z
names(z)
names(z) <- c('chow','beagle','pug','akita','mutt')
print(names(z))
print(z)

#add names as variable is built
z2 <- c(gold=3.3, silver=10, lead=2)
z2

#reset names
names(z2) <- NULL
z2
names(z2) <- c('copper','zinc')
z2

#use length and check individual elements with []
length(z)
z
z[3]
typeof(z[3])

#problems with NA for functions
z <- c(3.2,3.3, NA)
z
length(z)
typeof(z)
typeof(z[3])


is.na(z) #tells you which values are NA
mean(z) #NA b/c z has an NA value
!is.na(z) #NOT NA
mean(z[!is.na(z)]) #mean of subset of z that doesn't have NA

#NaN, -Inf, Inf
#NaN = Not a number
0/0
1/0
-1/0

#feature 1 of vecotrs: coercion
z <- c(0,'o')
typeof(z)

a <- runif(10)
a

#comparison operator yields a logical

a > 0.5

#doing math operations on a logcail coerces to a integer

#Ex: how many elements are greater than 0.5
sum(a > 0.5)

#proportion of elements meeting a condition
mean(a < 0.2)
mean(a > 0.2)
mean(a > 2)

#feature 2: vectorization
z <- c(10,20,30)
z + 1


#what happens when 2 vectors are added
y <- c(1,2,3)
z + y

#feature 3: recycling
z <- seq(1:6)
x <- c(10,20,30)
z+x

x <- c(10,20,30,40)
z+x
