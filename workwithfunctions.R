#working with functions
#3 March 2022
## RCS

sum(3,2) #prefix function
3+2 #using an operator
'+'(3,2) #an 'infix' function
y <- 3
'<-'(yy,3) #as an infix function
print(yy)

#to see contents of function, print it
print(read.table)
sd(c(3,2))
sd()

#function_name <- function(parX = X, parY =Y,, parZ = Z){
#body of function
#lines of r code + annotation
#may call other functions
#may createfunctions
#create local variables
#return(x)
#}

#use prominent hash tags and fencing at start and finish
#give head, with name, description, inputs, and outputs
#variable names can be short, not as descriptive
#function should be short and simple
#no more than 1 screenful of code for a function
#if to complex build more functions
#provide default values for all arguments
#use random number generator for default values

####################################################
#FUNCTION: hardy_weinberg
#generate HW genotype frequencies
#Input allele frequency p (0,1)
#output: p and frequencies of the 3 genotypes
#-------------------------------------------------
hardy_weinberg <- function(p = runif(1)){
  if(p>1 | p<0){
    return('function failure! p must be between 0 and 1')
  }
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vec_out <- signif(c(p=p,q=q,AA = fAA, AB = fAB, BB = fBB),digits = 3)
  return(vec_out)
}
##########################################################
hardy_weinberg()
hardy_weinber(p=0.5)
hardy_weinberg(1.1)
z <- hardy_weinberg((1.1)
z

#for proper error trapping use stop function           
####################################################
#FUNCTION: hardy_weinberg
#generate HW genotype frequencies
#Input allele frequency p (0,1)
#output: p and frequencies of the 3 genotypes
#-------------------------------------------------
hardy_weinberg2 <- function(p = runif(1)){
  if(p>1 | p<0){
    stop('function failure! p must be between 0 and 1')
  }
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vec_out <- signif(c(p=p,q=q,AA = fAA, AB = fAB, BB = fBB),digits = 3)
  return(vec_out)
}
##########################################################
z <- hardy_weinberg2(1.1)

#Global variables viwible to all parts of code
#global variables declared in main body of program
#local variables are visible only within a function
#local variables declared in the fuction or passed in through arguments provided for function
#functions can see variables in global environment
#but global environment cannot see variables within function

myfunct <- function(a=3,b=4){
  z <- a +b
  return(z)
}
myfunct()

myfunct_bad <- function(a=3){
  z <- a +b
  return(z)
}
myfunct_bad()  
b <- 100
myfunct_bad()

myfunct_OK <- function(a=3){
  b <- 200
  z <- a +b
  return(z)
}
myfunct_OK()

#create simple regression function
##########################################################3
# FUNCTION: fit_linear()
#fits ols regression line
#inoutes: numeric vecors of predictor (X) and response(y)
#outputs: slope and p-values
#--------------------------------------------------------
fit_linear <- function(x=runif(20),y=runif(20)){
  my_mod <- lm(y~x)
  my_out <- c(slope = summary(my_mod)$coefficients[2,1],pval = summary(my_mod)$coefficients[2,4])
  plot(x,y)
  return(my_out)
}
#--------------------------------------------------------------
fit_linear()

##########################################################3
# FUNCTION: fit_linear()
#fits ols regression line
#inoutes: numeric vecors of predictor (X) and response(y)
#outputs: slope and p-values
#--------------------------------------------------------
fit_linear2 <- function(par = NULL){
  if(is.null(par)){
    par <- list(x=runif(20),y=runif(20))
  }
  my_mod <- lm(par$y~par$x)
  my_out <- c(slope = summary(my_mod)$coefficients[2,1],pval = summary(my_mod)$coefficients[2,4])
  plot(par$x,par$y)
  return(my_out)
}
#--------------------------------------------------------------
fit_linear2()

#using do.call to pass a list of parameters to a function
z <- c(runif(99),NA)
mean(z)
mean(x=z,na.rm=TRUE)
