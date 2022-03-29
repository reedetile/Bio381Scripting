#more cool stuff w/ for loops
#24 March 2022
#RCS

library(tcltk)
library(ggplot2)
#######################################################
# FUNCTION: ran_walk
# Purpuse: stochastic random walk
#input:times = # of steps, n1 = initial pop size, lambda = finite rate of incr.,
# noise sd = sd of normal dist w/ mean 0
#output:
#-----------------------------------------------------

ran_walk <- function(times = 100, n1 = 50, lambda = 1.00, noise_sd = 10) {
  n <- rep(NA,times) #create output vector
  n[1] <- n1 #initialize w/ starting pop size
  noise <- rnorm(n=times,mean=0,sd=noise_sd) #create noise vector

  for (i in 1:(times - 1)){
    n[i+1] <- lambda*n[i]+noise[i]
    if(n[i+1] <= 0) {
      n[i+1] <- NA
      cat('population extinction at time', i,'\n')
      break }
  }#end of for loop 
  return(n)
}#end of ran_walk function
ran_walk()

qplot(x=1:100,y=ran_walk(),geom='line')

z <- ran_walk()
qplot(x=1:100, y=z,geom='line')
qplot(x = 1:length(z),y=z,geom='line')

#make random walk with no noise
z <- ran_walk(noise_sd=0)
qplot(x = 1:length(z),y=z,geom='line')

#make random walk with exponential growth
z <- ran_walk(times = 1000, lambda = 1.01, noise_sd=0)
qplot(x = 1:length(z),y=z,geom='line')

#make random walk with exponential decline
z <- ran_walk(times = 1000, lambda = 0.99, noise_sd=0)
qplot(x = 1:length(z),y=z,geom='line')

#make random walk that has growth with noise
z <- ran_walk(times = 100, lambda = 1.01, noise_sd=1)
qplot(x = 1:length(z),y=z,geom='line')




#using double for loops (for loop-ception)
#loop through rows
m <- matrix(round(runif(20),digits=2),nrow=5)
m
for(i in 1:nrow(m)){
  m[i,]<-m[i,]+i
}
print(m)

#loop through columns
m <- matrix(round(runif(20),digits=2),nrow=5)
m
for(j in 1:ncol(m)){
  m[,j]<- m[,j]+j
}
print(m)

#create a double loop
m <- matrix(round(runif(20),digits=2),nrow=5)
m
for(i in 1:nrow(m)){
  for(j in 1:ncol(m)){
    m[i,j]<- m[i,j]+i+j
  } #end of column j loop
}#end of row i loop
m

# S = c*A^z is the species area function, but what does it look like?
#######################################################
# FUNCTION: SpeciesAreaCurve
# Purpuse:creates power function relationshisps for S and A
#input: A is a vector of island areas
#       c is the intercept constant
#       z is slope constant
#output: S is a vector of species richness
#-----------------------------------------------------
SpeciesAreaCurve <- function(A = 1:5000,c=0.5,z=0.26) {
  S <- c*(A^z)
  return(S)
}
head(SpeciesAreaCurve())

#######################################################
# FUNCTION: species_area_plot
# Purpuse:plot species area curves with parameter values
#input:A is a vector of island areas
#       c is the intercept constant
#       z is slope constant
#output: smoothed curve with parameters in graph
#-----------------------------------------------------
species_area_plot <- function(A = 1:5000,c=0.5,z=0.26) {
  plot(x=A,
       y=SpeciesAreaCurve(A,c,z),
       type='l',xlab= 'Island Area',
       ylab = 'S',
       ylim=c(0,2500))
  mtext(paste('c=',c,'z=',z), cex=0.7)
}
species_area_plot()

###Now lets build a grid of plots!
c_pars <- c(100,150)
z_pars <- c(0.1,0.16,0.99)
par(mfrow=c(2,3))
for(i in seq_along(c_pars)){
  for(j in seq_along(z_pars)){
    species_area_plot(c=c_pars[i],z=z_pars[j])
  } #end inner for loop
} #end outer for loop
par(mfrow=c(1,1))
