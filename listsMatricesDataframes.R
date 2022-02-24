#Matrices, lists, and dataframes
#15 feb 2022
#RCS

#matrices
#matrix is an atomic vectorthat is organized into rows and cloumns

my_vec <- 1:12
m <- matrix(data = my_vec, nrow = 4)
m
m <- matrix(data = my_vec, ncol = 3)
m
m <- matrix(data = my_vec, ncol = 3, byrow = TRUE)
m

#Lists
#lists are also atomic vectors, but each list element can hold diff things of diff types and diff sizes

my_list <- list(1:10,matrix(1:8, nrow = 4, byrow = TRUE), letters[1:3], pi)
str(my_list)

#each item in a list is a car in a train
my_list[4]
my_list[4] - 3
my_list[[4]]-3
my_list[c(3,4)]
my_list[[2]]
my_list[[2]][4,1]

#name list items as you create them
my_list2 <- list(Tester = FALSE, 
                 little_m=matrix(1:9, nrow = 3))
my_list2$little_m[2,3]
my_list2$little_m                 
my_list2$little_m[2,]
my_list2$little_m[2]

#unlist to string everything in to a single atomic vector
unrolled <- unlist(my_list2)
str(unrolled)


#use this for working w/ output of a linear model which is a list
library(ggplot2)
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var ~ x_var)
print(my_model)
print(summary(my_model))
str(summary(my_model))

summary(my_model)$coefficients
summary(my_model)$coefficients['x_var', 'Pr(>|t|)']
summary(my_model)$coefficients[2,4]

#That's all long. Use unroll instead
u <- unlist(summary(my_model))
u
mySlope <- u$coefficients2
print(mySlope)


#data frames
#list of equal length vectors each of which is a column

var_a <- 1:12
var_b <- rep(c('Con','LowN','HighN'), each = 4)
var_c <- runif(12)
d_frame <- data.frame(var_a,var_b,var_c)
str(d_frame)
d_frame

new_data <- rnorm(12)
#now bind
d_frame <- rbind(d_frame,new_data)

#add a column w/ cbind
new_var <- runif(13)
d_frame <- cbind(d_frame, new_var)

#important distinction between matrices and lists
#create matrix and data frame w. same structures

z_mat <- matrix(data = 1:30, ncol = 3, byrow = TRUE)
z_dframe <- as.data.frame(z_mat)

#element referencing is the same
z_mat[3,3]
z_dframe[3,3]
z_mat[,3]
z_dframe[,3]
z_dframe$V3

#differences w/ single element call
z_mat[2]

#eliminating missing values
zD <- c(1:3,NA, 5:7)
zD
complete.cases(zD)
zD[complete.cases(zD)]
which(!complete.cases(zD))

#dealing w/ missing values in a matrix
z <- matrix(data=1:20, nrow = 5)
z
z[1,1] <- NA
z[5,4] <- NA
z
z[complete.cases(z),]

#Get rows that have complete cases for particular columns
z[complete.cases(z[,c(1,2)]),] #just for columns 1+2
z[complete.cases(z[,c(2,3)]),] #just columns 2+3
z[complete.cases(z[,c(3,4)]),] #just columns 3+4
z[complete.cases(z[,c(1,4)]),] #just columns 1+4

#techniques for assignments + subsetting

m <- matrix(data=1:12,nrow=3)
dimnames(m) <-
  list(paste('Species',LETTERS[1:nrow(m)],sep=''),
       paste('site',1:ncol(m),sep = ''))
m

#subsetting
m[1:2,3:4]

#same operations subsetting by names
m[c('SpeciesA','SpeciesB'),c('site3','site4')]

m[,]
m[1:2,]
m[,3:4]

#add up columns or rows
colSums(m)
rowSums(m)

colSums(m) > 15 #provides logical if column sums > 15
m[,colSums(m) > 15] #subsets columns > 15
m[rowSums(m) == 22,] #shows row where sum = 22

m[,'site1'] > 3
m[m[,'site1']<3,] #only shows spp. where site1 values were <3 
m['SpeciesA',]<5

#combine both
m[m[,'site1']<3, m['SpeciesA',]<5]

# caution simple subscripting can change data type
z <- m[1,]
z
str(z)

# use drop option to keep as matrix
z2 <- m[1, ,drop = FALSE] #keeps matrix structure
z2
str(z2)

