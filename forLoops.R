#For loops in R
#24 MArch 2022
#RCS

for (i in 1:5) {
 cat('stuck in a loop','\n') 
  cat(3+2,'\n')
  cat(runif(1),'\n')
}

#do something useful w/ counter variable
my_dogs <- c('chow','akita','malamute','husky','samoyed')
for (i in 1:length(my_dogs)) {
  cat('i=','my_dogs[i]=',my_dogs[i],'\n')
}

# be careful if vector is empty
my_bad_dogs <- NULL
for (i in 1:length(my_bad_dogs)) {
  cat('i=','my_bad_dogs[i]=',my_bad_dogs[i],'\n')
}

for (i in seq_along(my_bad_dogs)) {
  cat('i=','my_bad_dogs[i]=',my_bad_dogs[i],'\n')
}

#don't do things unnecessarily in loop!

for (i in 1:length(my_dogs)) {
  my_dogs[1] <- toupper(my_dogs[i])
 cat('i=',i,'my_dogs[i]=',my_dogs[i],'\n')
}

#toupper function doens't need to be in loop
my_dogs <- toupper(my_dogs)
for (i in 1:length(my_dogs)) {
  cat('i=',i,'my_dogs[i]=',my_dogs[i],'\n')
}

#don't change lengtho of objects in the loop
my_dat <- runif(1)
for (i in 2:10) {
  temp <- runif(1)
  my_dat <- c(my_dat,temp)
  cat('loop number=',i,'vector element = ', my_dat[i], '\n')
}

my_dat <- runif(1)
for (i in 2:10) {
  temp <- runif(1)
  my_dat <- c(my_dat,temp)
  cat('loop number=',i,'vector = ', my_dat, '\n')
}

#don't use a for loop if you don't need it
my_dat <-1:10
for (i in seq_along(my_dat)) {
  my_dat[i] <- my_dat[i] + my_dat[i]^2
}

my_dat <- 1:10
my_dat <- my_dat + my_dat^2

#be careful of distinction between i and z[i]
z <- c(10,2,4)
for (i in seq_along(z)){
  cat('i=','z[i]=',z[i],'\n')
}
print(i)
print(z[1])

#use next command to jump down and immediately skip to next loop iteration
z<- 1:20
#suppose we only want to operate on odd numbered elements
for (i in seq_along(z)){
  if(i %% 2 == 0) next
  print(i)
}

#alternate methods
z <- 1:20
zsub <- z[z %%2!=0]
zsub #odd only
