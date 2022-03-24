#more cool stuff w/ for loops
#24 March 2022
#RCS

#######################################################
# FUNCTION: ran_walk
# Purpuse: stochastic random walk
#input:times = # of steps, n1 = initial pop size, lambda = finite rate of incr.,
# noise sd = sd of normal dist w/ mean 0
#output:
#-----------------------------------------------------
library(tcltk)
library(ggplot2)
ran_walk <- function(times = 100, n1 = 50, lambda = 1.00, noise_sd = 10) {
  n <- rep(NA,times) #create ouput vector
  n[1] <- n1 #initialize w/ starting pop size
  noise <- rnorm(n=times,mean=0,sd=noise_sd)
}

ran_walk()
for (i in 1:times - 1){
  n[i+1] <- lambda*n[i]+noise[i]
  if(n[i+1] <= 0) {
    n[i+1] <- NA
    cat('population extinction at time', i=1,'\n')
    tkbell()
    break}
}
