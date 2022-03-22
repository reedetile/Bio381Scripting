#Logical operators
5>3
5<3
5<=5
5>=5
5==2
5!= 2

# use & AND
5 > 3 & 1 != 2
TRUE & TRUE
FALSE & TRUE

# | OR
FALSE | TRUE
FALSE|FALSE

#works w/ vectors
1:5 >3
a <- 1:10
b <- 10:1
a > 4 & b > 4

#use long form to evaluse only first element
a > 4 && b > 4

#same for or statements
a > 4 | b > 4
a > 4 || b > 4

# xor
xor(FALSE,FALSE)
xor(FALSE,TRUE)
xor(TRUE,TRUE)
a <- c(0,0,1)
b <- c(0,1,1)
xor(a,b)

#set operators
a <- 1:7
b <- 5:10

#union to get all elements
union(a,b)
c(a,b)

#intersection to get common elements
intersect(a,b)

#setdiff to get distinct elements in a vector from another vector
setdiff(a,b)
setdiff(b,a)

setequal(a,b)

#use identical for entire structures
z <- matrix(1:12, nrow = 4, byrow = TRUE)
z
z1 <- matrix(1:12, nrow = 4, byrow = FALSE)
z1

identical(z,z1)
z1 <- matrix(1:12, nrow = 4, byrow = TRUE)
identical(z,z1)

#most useful for if statements
#is.element() or %in%
#tells if element choosen is within object choosen
d <- 12
is.element(d,union(a,b))

#much preferred is %in% operator
d %in% union(a,b)

#if statements
#if(conditional 1){expression 1}
#else {expression 2}
#if(conditional) {expression 1} else {expression 2}

#######################################################
# FUNCTION: if_demo
# Purpuse:show how if statements work
#input:none
#output:varius conditional statements
#-----------------------------------------------------
if_demo <- function() {
  z <- signif(runif(1),digits =2)
  print(z)
  
  if (z >0.5){
    cat(z,'is a bigger than average number','\n')
  }
  if (z > 0.8){
    cat(z, 'is a large number')
  }else
    if (z <0.2){
      cat(z,'is a small number','\n')
    } else
    {cat(z,'is a number of typical size','\n')
      cat('z^2 =', z^2,'\n')
    }
  
} #end of function
if_demo()

#be careful with vectors and
#single boolean operators
z <- 1:10
if(z > 7) print(z)

#ptobsblu noy ehsy uou ensy
if(z<7) print(z)

#use subset and print!
print(z[z<7])

#use ifelse function
#ifelse(test,yesexpression,noexpression)
#female isnects lay 10.2 eggs on avg (poisson
#parasitoids have a 35% chance of finding and killing all eggs in the clutch
tester <- runif(1000)
eggs <- ifelse(tester>0.35,
               rpois(n=1000,lambda = 10.2),
               0)
hist(eggs)

#use ifelse to classify results of stats tests
p_vals <- runif(1000)
z <- ifelse(p_vals < 0.025,'lowerTail','nonSigif')
head(z)
z[p_vals>0.975] <- 'upperTail'
table(z)

#contaminate our label vectors
z <- c(z,'uperTail') #added upertail instead of upperTail
tail(z)
z <- sample(z)
head(z)
tail(z)
table(z)

#alternate way to generate labels
z1 <- rep('nonSignif',1000)
z1
z1[p_vals <= 0.025] <- 'lowerTail'
z1[p_vals >= 0.975] <- 'upperTail'
table(z1)

#for loops