#Description-----------------------------------------
#functional programing w/ lapply functions and more
#  26 Apr 2022
#RCS



# Program Body------------------------------------------
#diff kinds of functions
z <- 1:10

#built in functions ('prefix' functions)
mean(z)

# 'in-fix' functions
`+`(z,100)

#user defined functions
#######################################################
# FUNCTION: my_fun
# Purpuse: calculate max of sin of x+x
#input: numeric vector
#output: 1-element numeric vector
#-----------------------------------------------------
my_fun <- function(x=runif(5)) {
  z <- max(sin(x)+x)
  return(z)
}

my_fun()

#anonymous functions
#unnamed, used for simple calculation usually with a simple input by convention called x
function(x) x+3 #anonymous function
function(x) x+3 (10) #try to provide input
(function(x)x+3)(10)

### Functions that call functions

#first create some short used-defined functions
my_sum <- function(a,b) a+b
my_diff <- function(a,b)a-b
my_mult <- function(a,b)a*b

funct_1 <- function(a=3,b=2) sum(a,b)
funct_1()

funct_2 <- function(a=3,b=2) my_sum(a,b)
funct_2()

funct_3 <- function(a=3,b=2)my_mult(a,b)
funct_3()

#each time we want to use a diff one of the 'my' functions we have to create a new function to call it

#now pass data AND another function into a function as parameters
algebra <- function(x=my_sum,a=3,b=2) x(a,b)
algebra(x=my_sum)
algebra(x=my_diff)
algebra(x=my_mult)

#also works for passing in built in functions
algebra(x=sum)

#but this will not work
algebra(x=mean) #okay.... this shouldn't work

algebra(x=mean, a = 2, b=3) 
algebra(x=sqrt,a=2,b=3) #this is the error you should get w/ mean

algebra_vec<- function(x=mean,a=1:10) x(a) #can pass on any vector objects in to function
algebra_vec(x=sqrt)
algebra_vec(x=mean)
algebra_vec(x=sd)

#task 1: apply function to rows or colums of matrix
m <- matrix(1:20,nrow = 5,byrow=TRUE)
m

#for loop solution
#create a vector of lists to hold output
output <- rep(NA,nrow(m))
str(output)

#run function in a for loop for each row of matrix
for(i in seq_len(nrow(m))){
  output[[i]]<-my_fun(m[i,])
}
output

#run function in for loop for each column of the matrix
output <- rep(NA,ncol(m))
for(i in seq_len(ncol(m))){
  output[[i]]<-my_fun(m[,i])
}
output

#run a double for loop and apply to each element of matrix
output <- m
output[,]<-NA #assign each element in matrix value of NA
for(i in seq_len(nrow(m))){
  for(j in seq_len(ncol(m))){
    output[i,j] <- my_fun(m[i,j])
  }
}
output

#using the apply function to do the same thing
#apply(X,MARGIN,FUN,...)
#X = vector or an array (=matrix)
#margin 1=row,2=col,c(1,2)=rows and columns
#...optional arguments to FUN
row_out <- apply(X=m,MARGIN=1,FUN=my_fun)
row_out

### 'apply' solution w/ anonymous function
apply(m,1,function(x) max(sin(x)+x))
apply(m,2,function(x) max(sin(x)+x))
apply(m,c(1,2),function(x) max(sin(x)+x))

###what happend to output of variable length?
apply(m,1,sample)
#caution! array output is each vecotr in a column! to preserve original matrix dimensions we need to transpose
t(apply(m,1,sample)) #transpose

#function to choose a random number of elements
#from each row and pick them in a random order
apply(m,1,function(x) x[sample(1:length(x),size=sample(1:length(x)))])

### second task: apply a function to every column of a data frame
df <- data.frame(x=runif(20),y=runif(20),z=runif(20))
#create output
output <- rep(NA,ncol(df))
print(output)
for(i in seq_len(ncol(df))){
  output[i] <- sd(df[,i])/mean(df[,i])
}
print(output)

#using lapply to do the same thing
#lapply(X,FUN,...)
#x is a vector (atomic or list)
#FUN is a function applied to each element of the list
#(note that a data frame is a list of vectors!)
#...additional inputs to FUN
summary_out <- lapply(df,function(x) sd(x)/mean(x))
print(summary_out)

#sapply tries to simplify output to vector ormatrix
#vapply requires specified output formats v(erify)apply
#these are both special cases of lapply

treatment <- rep(c('control','Treatment'),each=(nrow(df)/2))
print(treatment)                 
df2 <- cbind(treatment,df)
head(df2)
output2 <- rep(NA, ncol(df2))
for(i in seq_len(ncol(df2))){
  if(!is.numeric(df2[,i]))next
  output2[i] <- sd(df2[,i])/mean(df2[,i])
}
output2

z <- lapply(df2,function(x) if(is.numeric(x)) sd(x)/mean(x))
z <- unlist(z)
z
